--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: abc; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE abc (
    path ltree
);


ALTER TABLE public.abc OWNER TO steve;

--
-- Name: army; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE army (
    id integer NOT NULL,
    campaign_id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    nation text DEFAULT ''::text NOT NULL,
    descr text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.army OWNER TO steve;

--
-- Name: army_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE army_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.army_id_seq OWNER TO steve;

--
-- Name: army_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE army_id_seq OWNED BY army.id;


--
-- Name: cav_type; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE cav_type (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    weight integer DEFAULT 1 NOT NULL,
    battle boolean,
    lances boolean,
    dragoon boolean,
    cossack boolean,
    dubious boolean
);


ALTER TABLE public.cav_type OWNER TO steve;

--
-- Name: cav_type_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE cav_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cav_type_id_seq OWNER TO steve;

--
-- Name: cav_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE cav_type_id_seq OWNED BY cav_type.id;


--
-- Name: cmd_action; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE cmd_action (
    id integer NOT NULL,
    descr text DEFAULT ''::text NOT NULL,
    chance integer DEFAULT 1 NOT NULL,
    rank integer DEFAULT 0 NOT NULL,
    level integer DEFAULT 0 NOT NULL,
    attach boolean,
    cav boolean,
    gun boolean,
    sk boolean,
    bayonet boolean,
    not_engaged boolean,
    engaged boolean,
    repulsed boolean,
    defeated boolean
);


ALTER TABLE public.cmd_action OWNER TO steve;

--
-- Name: cmd_action_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE cmd_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmd_action_id_seq OWNER TO steve;

--
-- Name: cmd_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE cmd_action_id_seq OWNED BY cmd_action.id;


--
-- Name: cmd_level; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE cmd_level (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.cmd_level OWNER TO steve;

--
-- Name: cmd_level_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE cmd_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmd_level_id_seq OWNER TO steve;

--
-- Name: cmd_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE cmd_level_id_seq OWNED BY cmd_level.id;


--
-- Name: cmd_rating; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE cmd_rating (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    effect integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cmd_rating OWNER TO steve;

--
-- Name: cmd_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE cmd_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmd_rating_id_seq OWNER TO steve;

--
-- Name: cmd_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE cmd_rating_id_seq OWNED BY cmd_rating.id;


--
-- Name: condition; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE condition (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    effect integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.condition OWNER TO steve;

--
-- Name: condition_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE condition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.condition_id_seq OWNER TO steve;

--
-- Name: condition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE condition_id_seq OWNED BY condition.id;


--
-- Name: drill; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE drill (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    ranks integer DEFAULT 3 NOT NULL,
    flankers boolean,
    elite_coy boolean,
    third_rank boolean,
    open_order boolean,
    line boolean,
    mixed boolean,
    att_col boolean,
    close_col boolean,
    oblique boolean,
    square boolean,
    mob boolean,
    control integer DEFAULT 1 NOT NULL,
    speed integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.drill OWNER TO steve;

--
-- Name: drill_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE drill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drill_id_seq OWNER TO steve;

--
-- Name: drill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE drill_id_seq OWNED BY drill.id;


--
-- Name: force; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE force (
    id integer NOT NULL,
    scenario_id integer DEFAULT 0 NOT NULL,
    red_team boolean,
    blue_team boolean,
    nation text DEFAULT ''::text NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    cmdr_name text DEFAULT ''::text NOT NULL,
    level integer DEFAULT 1 NOT NULL,
    descr text DEFAULT ''::text NOT NULL,
    rating integer DEFAULT 0 NOT NULL,
    inspiration integer DEFAULT 0 NOT NULL,
    condition integer DEFAULT 2 NOT NULL
);


ALTER TABLE public.force OWNER TO steve;

--
-- Name: force_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE force_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.force_id_seq OWNER TO steve;

--
-- Name: force_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE force_id_seq OWNED BY force.id;


--
-- Name: force_unit; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE force_unit (
    id integer NOT NULL,
    force_id integer NOT NULL,
    path ltree,
    name text DEFAULT ''::text NOT NULL,
    commander_name text DEFAULT ''::text NOT NULL,
    nation text DEFAULT ''::text NOT NULL,
    utype integer DEFAULT 1 NOT NULL,
    cmd_level integer DEFAULT 1 NOT NULL,
    drill integer DEFAULT 1 NOT NULL,
    bayonets integer DEFAULT 0 NOT NULL,
    small_arms integer DEFAULT 0 NOT NULL,
    elite_arms integer DEFAULT 0 NOT NULL,
    lt_coy integer DEFAULT 0 NOT NULL,
    jg_coy integer DEFAULT 0 NOT NULL,
    rating integer DEFAULT 5 NOT NULL,
    sabres integer DEFAULT 0 NOT NULL,
    cav_type integer DEFAULT 0 NOT NULL,
    cav_rating integer DEFAULT 0 NOT NULL,
    guns integer DEFAULT 0 NOT NULL,
    gunnery_type integer DEFAULT 0 NOT NULL,
    gun_condition integer DEFAULT 2 NOT NULL,
    horse_guns boolean DEFAULT false
);


ALTER TABLE public.force_unit OWNER TO steve;

--
-- Name: force_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE force_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.force_unit_id_seq OWNER TO steve;

--
-- Name: force_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE force_unit_id_seq OWNED BY force_unit.id;


--
-- Name: game; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE game (
    id integer NOT NULL,
    scenario_id integer NOT NULL,
    hosted_by integer DEFAULT 0 NOT NULL,
    created timestamp with time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    expires timestamp with time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    turn integer DEFAULT 1 NOT NULL,
    turn_limit integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.game OWNER TO steve;

--
-- Name: game_cmd; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE game_cmd (
    id integer NOT NULL,
    game_id integer DEFAULT 0 NOT NULL,
    red_team boolean,
    blue_team boolean,
    nation text DEFAULT ''::text NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    level integer DEFAULT 1 NOT NULL,
    descr text DEFAULT ''::text NOT NULL,
    rating integer DEFAULT 0 NOT NULL,
    inspiration integer DEFAULT 0 NOT NULL,
    condition integer DEFAULT 2 NOT NULL
);


ALTER TABLE public.game_cmd OWNER TO steve;

--
-- Name: game_cmd_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE game_cmd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_cmd_id_seq OWNER TO steve;

--
-- Name: game_cmd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE game_cmd_id_seq OWNED BY game_cmd.id;


--
-- Name: game_cmd_order; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE game_cmd_order (
    game_id integer NOT NULL,
    cmd_id integer NOT NULL,
    turns integer DEFAULT 2 NOT NULL,
    new_order integer NOT NULL,
    objective integer DEFAULT 0 NOT NULL,
    enemy integer DEFAULT 0 NOT NULL,
    friend integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.game_cmd_order OWNER TO steve;

--
-- Name: game_cmd_player; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE game_cmd_player (
    cmd_id integer NOT NULL,
    player_id integer NOT NULL
);


ALTER TABLE public.game_cmd_player OWNER TO steve;

--
-- Name: game_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_id_seq OWNER TO steve;

--
-- Name: game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE game_id_seq OWNED BY game.id;


--
-- Name: game_players; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE game_players (
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    red_team boolean,
    blue_team boolean
);


ALTER TABLE public.game_players OWNER TO steve;

--
-- Name: game_unit; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE game_unit (
    id integer NOT NULL,
    cmd_id integer NOT NULL,
    path ltree,
    name text DEFAULT ''::text NOT NULL,
    commander_control integer DEFAULT 10 NOT NULL,
    nation text DEFAULT ''::text NOT NULL,
    utype integer DEFAULT 1 NOT NULL,
    condition integer DEFAULT 2 NOT NULL,
    cmd_level integer DEFAULT 1 NOT NULL,
    drill integer DEFAULT 1 NOT NULL,
    table_sector integer DEFAULT 0 NOT NULL,
    deploy_to integer DEFAULT 1 NOT NULL,
    gt_formation integer DEFAULT 1 NOT NULL,
    sk_out boolean,
    woods boolean,
    rough boolean,
    cover boolean,
    rflank boolean,
    lflank boolean,
    has_support boolean,
    bayonets integer DEFAULT 0 NOT NULL,
    bayonets_lost integer DEFAULT 0 NOT NULL,
    bayonets_mstate integer DEFAULT 0 NOT NULL,
    bayonets_moved boolean,
    bayonets_fired boolean,
    small_arms integer DEFAULT 0 NOT NULL,
    elite_arms integer DEFAULT 0 NOT NULL,
    lt_coy integer DEFAULT 0 NOT NULL,
    rifles boolean,
    lt_lost integer DEFAULT 0 NOT NULL,
    lt_mstate integer DEFAULT 0 NOT NULL,
    rating integer DEFAULT 5 NOT NULL,
    sabres integer DEFAULT 0 NOT NULL,
    sabres_lost integer DEFAULT 0 NOT NULL,
    sabres_mstate integer DEFAULT 0 NOT NULL,
    sabres_charged integer DEFAULT 0 NOT NULL,
    cav_type integer DEFAULT 0 NOT NULL,
    cav_rating integer DEFAULT 0 NOT NULL,
    guns integer DEFAULT 0 NOT NULL,
    guns_lost integer DEFAULT 0 NOT NULL,
    guns_fired boolean,
    guns_moved boolean,
    guns_limbered boolean,
    guns_mstate integer DEFAULT 0 NOT NULL,
    gunnery_type integer DEFAULT 0 NOT NULL,
    gun_max_condition integer DEFAULT 2 NOT NULL,
    gun_condition integer DEFAULT 2 NOT NULL
);


ALTER TABLE public.game_unit OWNER TO steve;

--
-- Name: game_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE game_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_unit_id_seq OWNER TO steve;

--
-- Name: game_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE game_unit_id_seq OWNED BY game_unit.id;


--
-- Name: gt_formation; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE gt_formation (
    id integer NOT NULL,
    name text,
    speed integer,
    cav_defence boolean,
    march boolean,
    static boolean
);


ALTER TABLE public.gt_formation OWNER TO steve;

--
-- Name: gt_formation_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE gt_formation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gt_formation_id_seq OWNER TO steve;

--
-- Name: gt_formation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE gt_formation_id_seq OWNED BY gt_formation.id;


--
-- Name: gunnery; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE gunnery (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    cannister integer[],
    cannister_bad integer[],
    ranges integer[],
    good_effect integer[],
    bad_effect integer[],
    hw boolean
);


ALTER TABLE public.gunnery OWNER TO steve;

--
-- Name: gunnery_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE gunnery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gunnery_id_seq OWNER TO steve;

--
-- Name: gunnery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE gunnery_id_seq OWNED BY gunnery.id;


--
-- Name: inspiration; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE inspiration (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    effect integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.inspiration OWNER TO steve;

--
-- Name: inspiration_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE inspiration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inspiration_id_seq OWNER TO steve;

--
-- Name: inspiration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE inspiration_id_seq OWNED BY inspiration.id;


--
-- Name: login; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE login (
    user_id integer NOT NULL,
    date timestamp with time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    ip_address text DEFAULT ''::text NOT NULL,
    channel integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.login OWNER TO steve;

--
-- Name: oob_224_game_446; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE oob_224_game_446 (
    path ltree,
    commander text,
    inf integer,
    cav integer,
    art integer
);


ALTER TABLE public.oob_224_game_446 OWNER TO steve;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    min_rank integer DEFAULT 0 NOT NULL,
    objective boolean,
    enemy_unit boolean,
    friendly_unit boolean
);


ALTER TABLE public.orders OWNER TO steve;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO steve;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: rating; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE rating (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    code text DEFAULT ''::text NOT NULL,
    shock boolean,
    form_close boolean,
    form_engage boolean,
    sk_close boolean,
    attack_superior boolean,
    attack_guns boolean,
    fire_bonus integer DEFAULT 0 NOT NULL,
    melee_bonus integer DEFAULT 0 NOT NULL,
    ammo integer DEFAULT 10 NOT NULL
);


ALTER TABLE public.rating OWNER TO steve;

--
-- Name: rating_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_id_seq OWNER TO steve;

--
-- Name: rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE rating_id_seq OWNED BY rating.id;


--
-- Name: scenario; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE scenario (
    id integer NOT NULL,
    campaign_id integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    created timestamp with time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    forked_from integer DEFAULT 0 NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    descr text DEFAULT ''::text NOT NULL,
    notes text DEFAULT ''::text NOT NULL,
    year integer DEFAULT 1800 NOT NULL,
    public boolean DEFAULT true,
    latlon point,
    red_team text DEFAULT ''::text NOT NULL,
    red_brief text DEFAULT ''::text NOT NULL,
    blue_team text DEFAULT ''::text NOT NULL,
    blue_brief text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.scenario OWNER TO steve;

--
-- Name: scenario_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE scenario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scenario_id_seq OWNER TO steve;

--
-- Name: scenario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE scenario_id_seq OWNED BY scenario.id;


--
-- Name: scenario_unit; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE scenario_unit (
    id integer NOT NULL,
    cmd_id integer NOT NULL,
    path ltree,
    name text DEFAULT ''::text NOT NULL,
    nation text DEFAULT ''::text NOT NULL,
    utype integer DEFAULT 1 NOT NULL,
    condition integer DEFAULT 2 NOT NULL,
    cmd_level integer DEFAULT 1 NOT NULL,
    drill integer DEFAULT 1 NOT NULL,
    bayonets integer DEFAULT 0 NOT NULL,
    small_arms integer DEFAULT 0 NOT NULL,
    elite_arms integer DEFAULT 0 NOT NULL,
    lt_coy integer DEFAULT 0 NOT NULL,
    jg_coy integer DEFAULT 0 NOT NULL,
    rating integer DEFAULT 5 NOT NULL,
    sabres integer DEFAULT 0 NOT NULL,
    cav_type integer DEFAULT 0 NOT NULL,
    cav_rating integer DEFAULT 0 NOT NULL,
    guns integer DEFAULT 0 NOT NULL,
    gunnery_type integer DEFAULT 0 NOT NULL,
    gun_condition integer DEFAULT 2 NOT NULL
);


ALTER TABLE public.scenario_unit OWNER TO steve;

--
-- Name: scenario_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE scenario_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scenario_unit_id_seq OWNER TO steve;

--
-- Name: scenario_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE scenario_unit_id_seq OWNED BY scenario_unit.id;


--
-- Name: screnario; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE screnario (
    id integer NOT NULL,
    campaign_id integer DEFAULT 0 NOT NULL,
    author integer DEFAULT 0 NOT NULL,
    created timestamp with time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    forked_from integer DEFAULT 0 NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    descr text DEFAULT ''::text NOT NULL,
    year integer DEFAULT 1800 NOT NULL,
    latlon point,
    red_team text DEFAULT ''::text NOT NULL,
    red_brief text DEFAULT ''::text NOT NULL,
    blue_team text DEFAULT ''::text NOT NULL,
    blue_brief text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.screnario OWNER TO steve;

--
-- Name: screnario_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE screnario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.screnario_id_seq OWNER TO steve;

--
-- Name: screnario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE screnario_id_seq OWNED BY screnario.id;


--
-- Name: small_arms; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE small_arms (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    ranges integer[],
    effects integer[],
    covered integer[]
);


ALTER TABLE public.small_arms OWNER TO steve;

--
-- Name: small_arms_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE small_arms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.small_arms_id_seq OWNER TO steve;

--
-- Name: small_arms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE small_arms_id_seq OWNED BY small_arms.id;


--
-- Name: stdimg; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE stdimg (
    id integer NOT NULL,
    code text DEFAULT ''::text NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    photo text DEFAULT ''::text NOT NULL,
    preview text DEFAULT ''::text NOT NULL,
    thumb text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.stdimg OWNER TO steve;

--
-- Name: stdimg_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE stdimg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stdimg_id_seq OWNER TO steve;

--
-- Name: stdimg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE stdimg_id_seq OWNED BY stdimg.id;


--
-- Name: unit; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE unit (
    id integer NOT NULL,
    cmd_id integer DEFAULT 0 NOT NULL,
    path ltree,
    name text DEFAULT ''::text NOT NULL,
    nation text DEFAULT ''::text NOT NULL,
    utype integer DEFAULT 1 NOT NULL,
    cmd_level integer DEFAULT 1 NOT NULL,
    drill integer DEFAULT 1 NOT NULL,
    bayonets integer DEFAULT 0 NOT NULL,
    small_arms integer DEFAULT 0 NOT NULL,
    elite_arms integer DEFAULT 0 NOT NULL,
    lt_coy integer DEFAULT 0 NOT NULL,
    jg_coy integer DEFAULT 0 NOT NULL,
    rating integer DEFAULT 5 NOT NULL,
    sabres integer DEFAULT 0 NOT NULL,
    cav_type integer DEFAULT 0 NOT NULL,
    cav_rating integer DEFAULT 0 NOT NULL,
    guns integer DEFAULT 0 NOT NULL,
    gunnery_type integer DEFAULT 0 NOT NULL,
    gun_condition integer DEFAULT 2 NOT NULL
);


ALTER TABLE public.unit OWNER TO steve;

--
-- Name: unit_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unit_id_seq OWNER TO steve;

--
-- Name: unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE unit_id_seq OWNED BY unit.id;


--
-- Name: user_rego; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE user_rego (
    user_id integer DEFAULT 0 NOT NULL,
    created timestamp with time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    expires timestamp with time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    charge numeric(8,2),
    receipt text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.user_rego OWNER TO steve;

--
-- Name: users; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username text NOT NULL,
    passwd text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    rank integer DEFAULT 1 NOT NULL,
    created timestamp with time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    expires timestamp with time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL,
    channel integer DEFAULT 0 NOT NULL,
    ip_address text DEFAULT ''::text NOT NULL,
    country text DEFAULT ''::text NOT NULL,
    bloglink text DEFAULT ''::text NOT NULL,
    notes text DEFAULT ''::text NOT NULL,
    banned boolean DEFAULT false NOT NULL,
    disqus boolean DEFAULT true NOT NULL,
    newsletter boolean DEFAULT true NOT NULL
);


ALTER TABLE public.users OWNER TO steve;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO steve;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: utype; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE utype (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.utype OWNER TO steve;

--
-- Name: utype_id_seq; Type: SEQUENCE; Schema: public; Owner: steve
--

CREATE SEQUENCE utype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utype_id_seq OWNER TO steve;

--
-- Name: utype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: steve
--

ALTER SEQUENCE utype_id_seq OWNED BY utype.id;


--
-- Name: vcode; Type: TABLE; Schema: public; Owner: steve; Tablespace: 
--

CREATE TABLE vcode (
    uid integer NOT NULL,
    code text DEFAULT ''::text NOT NULL,
    expires timestamp without time zone DEFAULT (now() + '02:00:00'::interval)
);


ALTER TABLE public.vcode OWNER TO steve;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY army ALTER COLUMN id SET DEFAULT nextval('army_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY cav_type ALTER COLUMN id SET DEFAULT nextval('cav_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY cmd_action ALTER COLUMN id SET DEFAULT nextval('cmd_action_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY cmd_level ALTER COLUMN id SET DEFAULT nextval('cmd_level_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY cmd_rating ALTER COLUMN id SET DEFAULT nextval('cmd_rating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY condition ALTER COLUMN id SET DEFAULT nextval('condition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY drill ALTER COLUMN id SET DEFAULT nextval('drill_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY force ALTER COLUMN id SET DEFAULT nextval('force_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY force_unit ALTER COLUMN id SET DEFAULT nextval('force_unit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY game ALTER COLUMN id SET DEFAULT nextval('game_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY game_cmd ALTER COLUMN id SET DEFAULT nextval('game_cmd_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY game_unit ALTER COLUMN id SET DEFAULT nextval('game_unit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY gt_formation ALTER COLUMN id SET DEFAULT nextval('gt_formation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY gunnery ALTER COLUMN id SET DEFAULT nextval('gunnery_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY inspiration ALTER COLUMN id SET DEFAULT nextval('inspiration_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY rating ALTER COLUMN id SET DEFAULT nextval('rating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY scenario ALTER COLUMN id SET DEFAULT nextval('scenario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY scenario_unit ALTER COLUMN id SET DEFAULT nextval('scenario_unit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY screnario ALTER COLUMN id SET DEFAULT nextval('screnario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY small_arms ALTER COLUMN id SET DEFAULT nextval('small_arms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY stdimg ALTER COLUMN id SET DEFAULT nextval('stdimg_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY unit ALTER COLUMN id SET DEFAULT nextval('unit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: steve
--

ALTER TABLE ONLY utype ALTER COLUMN id SET DEFAULT nextval('utype_id_seq'::regclass);


--
-- Data for Name: abc; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY abc (path) FROM stdin;
\.


--
-- Data for Name: army; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY army (id, campaign_id, name, nation, descr) FROM stdin;
\.


--
-- Name: army_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('army_id_seq', 1, false);


--
-- Data for Name: cav_type; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY cav_type (id, name, weight, battle, lances, dragoon, cossack, dubious) FROM stdin;
1	Cuirassier	3	t	f	f	f	f
2	Hussar	1	t	f	f	f	f
3	Chasseur	1	f	f	t	f	f
4	Lancers	1	t	t	f	f	f
5	Dragoons	2	f	f	t	f	f
6	Cossack	1	f	t	f	t	f
7	Landwehr	2	f	t	f	f	t
8	Heavy Dragoons	3	t	f	f	f	f
9	Carabiniers	3	t	f	f	f	f
10	Mtd Jagers	1	f	f	t	f	f
11	Irregular	1	f	f	f	t	t
12	Lt Dragoons	1	f	f	t	f	f
\.


--
-- Name: cav_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('cav_type_id_seq', 1, false);


--
-- Data for Name: cmd_action; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY cmd_action (id, descr, chance, rank, level, attach, cav, gun, sk, bayonet, not_engaged, engaged, repulsed, defeated) FROM stdin;
1	Move Commander	1	1	3	t	t	t	t	t	t	t	t	f
2	Cavalry Charge	3	1	4	f	t	f	f	f	t	t	f	f
3	Skirmisher Screen	1	1	4	f	f	f	f	t	t	t	t	f
4	Recall Skirmishers	2	1	4	f	f	f	t	f	t	t	f	f
5	Cavalry Dismount	2	2	4	f	t	f	f	f	t	t	f	f
6	Cavalry Remount	3	2	4	f	t	f	f	f	t	t	f	f
7	Deploy Guns	3	1	3	f	f	t	f	f	t	f	f	f
8	Relocate Guns	3	2	3	f	f	t	f	f	t	f	f	f
9	Retire Guns	3	1	3	f	f	t	f	f	t	t	t	f
10	Cold Steel!	3	1	4	f	f	f	f	t	f	t	f	f
11	Fire!	2	1	4	f	f	f	f	t	f	t	f	f
12	Fall Back	1	1	3	f	t	f	t	t	f	t	t	t
13	Sauve Qui Peut!	3	2	2	f	t	t	t	t	t	t	t	t
14	Last Stand!	4	2	3	f	f	t	f	t	f	t	t	t
15	Form Bde Square	2	2	3	f	f	t	f	t	t	t	f	f
16	Redeploy under Fire	4	2	3	f	t	t	t	t	f	t	f	f
17	Change Formation / Facing	2	1	3	f	t	f	f	t	t	f	t	f
18	Halt!	2	2	3	f	t	t	t	t	t	t	f	f
19	Rally the Troops	3	2	3	f	t	t	t	t	t	f	t	t
20	Emergency Rally!	4	2	3	f	t	t	t	t	f	t	t	t
21	Detach Unit	2	2	3	f	t	t	t	t	t	f	f	f
22	Advance to Contact	2	2	3	f	f	f	t	t	t	f	f	f
23	Advance!	1	1	4	f	f	f	t	t	f	t	f	f
24	Prepare Defence	2	2	4	f	f	t	t	t	t	f	t	f
25	Bombardment	2	1	3	f	f	t	f	f	t	f	f	f
\.


--
-- Name: cmd_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('cmd_action_id_seq', 1, false);


--
-- Data for Name: cmd_level; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY cmd_level (id, name) FROM stdin;
1	Army
2	Corps
3	Division
4	Brigade
5	Battalion
6	Company
\.


--
-- Name: cmd_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('cmd_level_id_seq', 1, false);


--
-- Data for Name: cmd_rating; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY cmd_rating (id, name, effect) FROM stdin;
1	Magnificent	2
2	Highly Efficient	1
3	Competent	0
4	Doddering Fool	-1
5	Blithering Idiot	-2
\.


--
-- Name: cmd_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('cmd_rating_id_seq', 1, false);


--
-- Data for Name: condition; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY condition (id, name, effect) FROM stdin;
1	Parade Order	2
2	Battle Ready	1
3	Adequate	0
4	Tattered	-1
5	Spent	-3
\.


--
-- Name: condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('condition_id_seq', 1, false);


--
-- Data for Name: drill; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY drill (id, name, ranks, flankers, elite_coy, third_rank, open_order, line, mixed, att_col, close_col, oblique, square, mob, control, speed) FROM stdin;
1	Linear	3	f	f	f	f	t	f	f	t	t	t	f	8	2
2	Green Conscript	3	f	f	f	f	t	f	f	t	f	f	t	4	1
3	Basic Training	3	f	f	t	f	t	f	t	t	f	f	f	5	2
4	Prussian Reformed	3	f	f	t	f	t	t	t	f	f	t	f	6	2
5	French Drilled	3	f	t	f	f	t	t	t	t	f	t	f	8	3
6	French Legere	3	f	t	f	t	t	t	t	t	f	t	f	8	3
7	British Drilled	2	t	f	f	f	t	t	t	f	t	t	f	9	2
8	Irregular Light Infantry	2	f	f	f	t	t	f	f	t	f	f	t	3	3
9	Drilled Light Infantry	2	f	t	f	t	t	f	f	f	t	t	f	7	4
\.


--
-- Name: drill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('drill_id_seq', 1, false);


--
-- Data for Name: force; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY force (id, scenario_id, red_team, blue_team, nation, name, cmdr_name, level, descr, rating, inspiration, condition) FROM stdin;
4	1	t	f	France	IV Corps	Soult	2		3	3	3
5	1	t	f	France	V Corps	Lannes	2		2	1	3
6	1	t	f	France	VI Corps	Ney	2		2	3	2
8	1	t	f	France	Cavalry Reserve	Murat	2		3	2	3
9	1	t	f	France	Supply		4		4	3	2
10	1	f	t	Prussia	Army Grp South	Hohenlohe	1		4	3	2
11	1	f	t	Prussia	Advanced Guard	Ferdinand	3		4	4	4
12	1	f	t	Prussia	Army Grp North	Duke of Brunswick	2		4	3	4
13	1	f	t	Prussia	Guard Reserve	Kalkreuth	3		3	4	1
14	1	f	t	Prussia	Supply Train		3		4	3	4
3	1	t	f	France	III Corps	Davout	2		1	3	2
1	1	t	f	France	Imperial Guard	Napoleon	2		1	1	1
2	1	t	f	France	I Corps	General Bernadotte	2		3	3	2
7	1	t	f	France	VII Corps	Augereau	2		2	2	2
16	6	t	f	redland	II Corp	2nd Commander	2		3	3	3
\.


--
-- Name: force_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('force_id_seq', 26, true);


--
-- Data for Name: force_unit; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY force_unit (id, force_id, path, name, commander_name, nation, utype, cmd_level, drill, bayonets, small_arms, elite_arms, lt_coy, jg_coy, rating, sabres, cav_type, cav_rating, guns, gunnery_type, gun_condition, horse_guns) FROM stdin;
215	11	Adv_Guard_Div	Adv Guard Div	Ferdinand	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
216	11	Adv_Guard_Div.von_Pelet_Ruehle_Rabenau	von Pelet, Rühle, Rabenau		Prussia	2	4	9	1400	1	0	0	3	4	0	0	0	0	0	0	f
217	11	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua		Prussia	2	4	1	2400	1	0	1	0	5	0	0	0	1	3	0	f
219	11	Adv_Guard_Div.Md_Foot_Bty	Md Foot Bty		Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	2	4	f
220	11	Adv_Guard_Div.Md_Horse_Bty	Md Horse Bty		Prussia	4	1	0	0	0	0	0	0	4	0	0	0	8	2	3	f
218	11	Adv_Guard_Div.Saxon_Hussars	Saxon Hussars		Saxony	3	4	0	0	0	0	0	0	3	900	2	2	0	0	0	f
13	2	2nd_Division.45e_Ligne	45e Ligne	Rivaud	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
14	2	2nd_Division.54e_Ligne	54e Ligne	Rivaud	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
7	2	2eme_Division	2eme Division	Rivaud	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
11	2	1st_Division.32e_Ligne	32e Ligne	de l'Eltang	France	2	4	5	2000	1	0	0	0	4	0	0	0	0	0	0	f
6	2	1eme_Division	1eme Division	de l'Eltang	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
12	2	1st_Division.96e_Ligne	96e Ligne	de l'Eltang	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
9	2	1st_Division.9e_Legere	9e Legere	de l'Eltang	France	2	4	6	2600	1	2	0	0	4	0	0	0	0	3	0	f
30	2	1st_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	0	0	0	0	8	2	3	f
31	2	2nd_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	0	0	0	0	8	2	3	f
10	2	2nd_Division.4e_Legere	4e Legere	Rivaud	France	2	4	6	2000	1	0	1	0	5	0	0	0	0	0	0	f
42	1	Infantry_Division.1e_Grenadiers	1e Grenadiers		France	2	4	5	2400	1	0	0	0	1	0	0	0	0	0	0	f
33	2	Cav_Reserve	Cav Reserve	Tilley	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
44	1	Infantry_Division.2e_Grenadiers	2e Grenadiers		France	2	1	5	2400	1	0	0	0	1	0	0	0	0	0	0	f
34	2	Cav_Reserve.2e_Hussar	2e Hussar		France	3	4	0	0	0	0	0	0	3	300	2	3	0	0	0	f
48	1	Guard_Artillery.Army_Artillery_Park	Army Artillery Park			4	4	0	0	0	0	0	0	4	0	0	0	16	1	2	f
40	1	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval		France	3	4	0	0	0	0	0	0	3	600	3	1	0	0	0	f
35	2	Cav_Reserve.4e_Hussar	4e Hussar		France	3	1	0	0	0	0	0	0	3	422	2	4	0	0	0	f
36	2	Artillery_Reserve	Artillery Reserve	Eble	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
45	1	Infantry_Division.1e_Chasseurs	1e Chasseurs		France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
37	2	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	2	f
41	1	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval		France	3	1	0	0	0	0	0	0	3	400	8	1	0	0	0	f
50	1	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery			4	1	0	0	0	0	0	0	4	0	0	0	24	2	1	f
38	1	Guard_Artillery	Guard Artillery	de Lamartiniére	France	1	4	1	0	0	0	0	0	2	0	0	0	0	0	2	f
47	1	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy		France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
4	1	Infantry_Division	Infantry Division	Lefebvre	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
46	1	Infantry_Division.Foot_Dragoons	Foot Dragoons		France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
5	1	Cavalry_Division	Cavalry Division	Bessieres	France	1	3	1	0	0	0	0	0	1	0	0	0	0	0	2	f
53	3	1eme_Division.13e_Legere	13e Legere		France	2	4	6	1400	1	0	0	0	3	0	0	0	0	0	0	f
52	3	1eme_Division	1eme Division	Morand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
61	3	2eme_Division.108e_Ligne	108e Ligne		France	2	1	5	1600	1	0	0	0	5	0	0	0	0	0	0	f
56	3	1eme_Division.51e_Ligne	51e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
49	1	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty			4	1	0	0	0	0	0	0	4	0	0	0	8	3	1	f
54	3	1eme_Division.17e_Ligne	17e Ligne		France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
58	3	1eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	2	f
57	3	1eme_Division.61e_Ligne	61e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
55	3	1eme_Division.30e_Ligne	30e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
8	2	3eme_Division	3eme Division	Drouet	France	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
59	3	2eme_Division	2eme Division	Friant	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
18	2	3eme_Division.95e_Ligne	95e Ligne	Drouet	France	2	4	5	2600	1	0	0	0	5	0	0	0	0	0	0	f
16	2	3eme_Division.27e_Legere	27e Legere	Drouet	France	2	4	6	1500	1	0	2	0	5	0	0	0	0	3	0	f
32	2	3eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	0	0	0	0	8	2	3	f
17	2	3eme_Division.94e_Ligne	94e Ligne	Drouet	France	2	4	5	1500	1	0	0	0	5	0	0	0	0	0	0	f
100	4	3eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	2	f
62	3	2eme_Division.33e_Ligne	33e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
83	4	2eme_Division	2eme Division	Leval	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
91	4	2eme_Division.28e_Ligne	28e Ligne		France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
79	4	1eme_Division.35e_Ligne	35e Ligne		France	2	4	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
73	3	Corps_Artillery.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	2	f
65	3	2eme_Division.48e_Ligne	48e Ligne		France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
64	3	2eme_Division.111e_Ligne	111e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
97	4	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy		France/Corsica	2	1	6	1300	1	2	0	1	3	0	0	0	0	0	0	f
85	4	2eme_Division.46e_Ligne	46e Ligne		France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
74	3	Cav_Bde	Cav Bde	Viallanes	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
66	3	3eme_Division	3eme Division	Gudin	France	1	1	1	0	0	0	0	0	3	0	0	0	0	0	2	f
80	4	1eme_Division.43e_Ligne	43e Ligne		France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
67	3	3eme_Division.12e_Ligne	12e Ligne		France	2	1	5	1300	1	0	0	0	5	0	0	0	0	0	0	f
88	4	2eme_Division.24e_Legere	24e Legere		France	2	1	6	2000	1	0	0	0	4	0	0	0	0	0	0	f
71	3	3eme_Division.21e_Ligne	21e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
69	3	3eme_Division.25e_Ligne	25e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
84	4	2eme_Division.4e_Ligne	4e Ligne		France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
70	3	3eme_Division.85e_Ligne	85e Ligne		France	2	1	5	1600	1	0	0	0	5	0	0	0	0	0	0	f
82	4	1eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	2	f
75	3	Cav_Bde.1e_Chasseur	1e Chasseur		France	3	4	0	0	0	0	0	0	3	600	3	3	0	0	0	f
76	3	Cav_Bde.2e_Chasseur	2e Chasseur		France	3	1	0	0	0	0	0	0	3	600	3	3	0	0	0	f
72	3	Corps_Artillery	Corps Artillery	Hannicque	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
77	4	1eme_Division	1eme Division	St Hilaire	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
95	4	3eme_Division.26e_Legere	26e Legere		France	2	4	6	1600	1	0	0	0	3	0	0	0	0	0	0	f
78	4	1eme_Division.10e_Legere	10e Legere		France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
92	4	2eme_Division.57e_Ligne	57e Ligne		France	2	1	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
106	5	Cav_Bde	Cav Bde	Trelliard	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
93	4	2eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	3	f
98	4	3eme_Division.18e_Ligne	18e Ligne		France	2	4	5	1800	1	0	0	0	4	0	0	0	0	0	0	f
63	3	2eme_Division.Md_Foot_Bty	Md Foot Bty			4	1	0	0	0	0	0	0	4	0	0	0	8	2	2	f
68	3	3eme_Division.Md_Foot_Bty	Md Foot Bty			4	1	0	0	0	0	0	0	4	0	0	0	8	2	2	f
103	4	Corps_Cavaly.22e_Chasseur	22e Chasseur		France	3	1	0	0	0	0	0	0	3	600	3	4	0	0	0	f
90	4	1eme_Division.55e_Ligne	55e Ligne		France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
101	4	Corps_Cavaly	Corps Cavaly	Guyot	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
94	4	3eme_Division	3eme Division	LeGrand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
99	4	3eme_Division.75e_Ligne	75e Ligne		France	2	4	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
96	4	3eme_Division.Po_Legere	Po Legere		France/Italy	2	4	6	1000	1	2	2	0	3	0	0	0	0	0	0	f
105	4	Corps_Artillery.Heavy_Bty	Heavy Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	1	3	f
104	4	Corps_Artillery	Corps Artillery		France	1	5	1	0	0	0	0	0	3	0	0	0	0	0	2	f
102	4	Corps_Cavaly.11e_Chasseur	11e Chasseur		France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
107	5	Cav_Bde.10e_Hussar	10e Hussar		France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
108	5	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy		France	3	1	0	0	0	0	0	0	3	600	2	3	0	0	0	f
109	5	Corps_Artillery	Corps Artillery	Careil	France	1	5	1	0	0	0	0	0	3	0	0	0	0	0	2	f
110	5	Corps_Artillery.Heavy_Foot	Heavy Foot			4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
111	5	1eme_Division	1eme Division	Suchet	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
112	5	1eme_Division.17e_Legere	17e Legere		France	2	4	6	2100	1	0	0	0	3	0	0	0	0	0	0	f
113	5	1eme_Division.34e_Ligne	34e Ligne		France	2	4	5	2500	1	0	0	0	5	0	0	0	0	0	0	f
114	5	1eme_Division.40e_Ligne	40e Ligne		France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
115	5	1eme_Division.64e_Ligne	64e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
125	6	Cav_Bde.9e_Hussar	9e Hussar		France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
116	5	1eme_Division.88e_Ligne	88e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
117	5	1eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	3	f
132	6	1eme_Division.39e_Ligne	39e Ligne		France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
118	5	2eme_Division	2eme Division	Gazan	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
142	7	Corps_Cav.7e_Chasseur	7e Chasseur		France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
133	6	1eme_Division.69e_Ligne	69e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
119	5	2eme_Division.21e_Legere	21e Legere		France	2	4	6	1800	1	0	0	0	5	0	0	0	0	0	0	f
126	6	Cav_Bde.10e_Chasseur	10e Chasseur		France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
134	6	1eme_Division.76e_Ligne	76e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
127	6	Corps_Artillery	Corps Artillery		France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
120	5	2eme_Division.28e_Legere	28e Legere		France	2	4	6	900	1	0	0	0	3	0	0	0	0	0	0	f
139	6	2eme_Division.59e_Ligne	59e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
128	6	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
121	5	2eme_Division.100e_Ligne	100e Ligne		France	2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
122	5	2eme_Division.103e_Ligne	103e Ligne		France	2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
129	6	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty			4	1	0	0	0	0	0	0	4	0	0	0	8	1	2	f
123	5	2eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	3	f
135	6	2eme_Division	2eme Division	Gardanne	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
130	6	1eme_Division	1eme Division	Marchand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
124	6	Cav_Bde	Cav Bde	Charbanais	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
138	6	2eme_Division.50e_Ligne	50e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
150	7	1eme_Division.105e_Ligne	105e Ligne		France	2	1	3	1700	1	0	0	0	5	0	0	0	0	0	0	f
140	6	2eme_Division.27e_Ligne	27e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
143	7	Corps_Cav.20e_Chasseur	20e Chasseur		France	3	1	0	0	0	0	0	0	3	600	3	4	0	0	0	f
131	6	1eme_Division.6e_Legere	6e Legere		France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
136	6	2eme_Division.25e_Legere	25e Legere		France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
148	7	1eme_Division.14e_Ligne	14e Ligne		France	2	4	5	700	1	0	0	0	4	0	0	0	0	0	0	f
141	7	Corps_Cav	Corps Cav	Durosnel	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
144	7	Corps_Artillery	Corps Artillery		France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
155	7	2eme_Division.63e_Ligne	63e Ligne		France	2	1	5	700	1	0	0	0	5	0	0	0	0	0	0	f
151	7	1eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	3	f
145	7	Corps_Artillery.Heavy_Bty	Heavy Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
147	7	1eme_Division.16e_Legere	16e Legere		France	2	4	6	2700	1	0	0	0	4	0	0	0	0	0	0	f
149	7	1eme_Division.44e_Ligne	44e Ligne		France	2	1	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
146	7	1eme_Division	1eme Division	Desjardin	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
154	7	2eme_Division.24e_Ligne	24e Ligne		France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
153	7	2eme_Division.7e_Legere	7e Legere		France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
152	7	2eme_Division	2eme Division	Bierre	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
156	7	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt		Hesse	2	1	1	800	1	0	0	0	4	0	0	0	0	0	0	f
158	7	2eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	3	f
159	8	Corps_Artillery	Corps Artillery		France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
157	7	2eme_Division.Allied_Nassau	Allied Nassau		Nassau	2	1	5	400	1	0	0	0	4	0	0	0	0	0	0	f
160	8	Corps_Artillery.1e_Horse	1e Horse			4	4	0	0	0	0	0	0	4	0	0	0	8	2	2	f
161	8	Corps_Artillery.2e_Horse	2e Horse			4	1	0	0	0	0	0	0	4	0	0	0	8	2	2	f
162	8	1e_Cuirassier_Div	1e Cuirassier Div	Nansouty	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
164	8	1e_Dragoon_Div	1e Dragoon Div	Klein	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
163	8	2e_Cuirassier_Div	2e Cuirassier Div	d'Hautpoul	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
165	8	2e_Dragoon_Div	2e Dragoon Div	Grouchy	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
173	8	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere		France	3	4	0	0	0	0	0	0	3	600	1	4	0	0	0	f
166	8	3e_Dragoon_Div	3e Dragoon Div	Beaumont	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
184	9	Supply_Train.Supply_Detachment	Supply Detachment			5	4	3	900	1	2	4	0	6	140	3	4	0	0	0	f
167	8	4e_Dragoon_Div	4e Dragoon Div	Sahut	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
174	8	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice		France	3	1	0	0	0	0	0	0	3	600	1	4	0	0	0	f
168	8	Light_Div	Light Div	Lasalle	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
182	8	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar		France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
181	8	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar		France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
183	9	Supply_Train	Supply Train		France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
175	8	2e_Dragoon_Div.Bde_Roget	Bde Roget		France	3	4	0	0	0	0	0	0	3	900	5	5	0	0	0	f
169	8	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance		France	3	4	0	0	0	0	0	0	3	600	9	2	0	0	0	f
176	8	2e_Dragoon_Div.Bde_Milet	Bde Milet		France	3	1	0	0	0	0	0	0	3	600	5	5	0	0	0	f
170	8	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye		France	3	1	0	0	0	0	0	0	3	1300	1	2	0	0	0	f
187	16	Kill_this_one_as_well	Kill this one as well			1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
171	8	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz		France	3	4	0	0	0	0	0	0	3	600	5	4	0	0	0	f
180	8	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche		France	3	1	0	0	0	0	0	0	3	1200	5	5	0	0	0	f
172	8	1e_Dragoon_Div.Bde_Picard	Bde Picard		France	3	1	0	0	0	0	0	0	3	600	5	4	0	0	0	f
179	8	4e_Dragoon_Div.Bde_Margaron	Bde Margaron		France	3	4	0	0	0	0	0	0	3	1200	5	5	0	0	0	f
188	16	Kill_this_one_as_well.2nd_Special_Forces_killer_BDE	2nd Special Forces killer BDE			2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
177	8	3e_Dragoon_Div.Bde_Boye	Bde Boye		France	3	4	0	0	0	0	0	0	3	900	5	5	0	0	0	f
178	8	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg		France	3	1	0	0	0	0	0	0	3	600	5	5	0	0	0	f
\.


--
-- Name: force_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('force_unit_id_seq', 220, true);


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY game (id, scenario_id, hosted_by, created, expires, turn, turn_limit) FROM stdin;
\.


--
-- Data for Name: game_cmd; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY game_cmd (id, game_id, red_team, blue_team, nation, name, level, descr, rating, inspiration, condition) FROM stdin;
\.


--
-- Name: game_cmd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('game_cmd_id_seq', 1, false);


--
-- Data for Name: game_cmd_order; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY game_cmd_order (game_id, cmd_id, turns, new_order, objective, enemy, friend) FROM stdin;
\.


--
-- Data for Name: game_cmd_player; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY game_cmd_player (cmd_id, player_id) FROM stdin;
\.


--
-- Name: game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('game_id_seq', 1, false);


--
-- Data for Name: game_players; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY game_players (game_id, player_id, red_team, blue_team) FROM stdin;
\.


--
-- Data for Name: game_unit; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY game_unit (id, cmd_id, path, name, commander_control, nation, utype, condition, cmd_level, drill, table_sector, deploy_to, gt_formation, sk_out, woods, rough, cover, rflank, lflank, has_support, bayonets, bayonets_lost, bayonets_mstate, bayonets_moved, bayonets_fired, small_arms, elite_arms, lt_coy, rifles, lt_lost, lt_mstate, rating, sabres, sabres_lost, sabres_mstate, sabres_charged, cav_type, cav_rating, guns, guns_lost, guns_fired, guns_moved, guns_limbered, guns_mstate, gunnery_type, gun_max_condition, gun_condition) FROM stdin;
\.


--
-- Name: game_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('game_unit_id_seq', 1, false);


--
-- Data for Name: gt_formation; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY gt_formation (id, name, speed, cav_defence, march, static) FROM stdin;
\.


--
-- Name: gt_formation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('gt_formation_id_seq', 1, false);


--
-- Data for Name: gunnery; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY gunnery (id, name, cannister, cannister_bad, ranges, good_effect, bad_effect, hw) FROM stdin;
1	12lb	{{15,15,26,26,30,40},{10,10,16,17,20,27},{8,8,14,14,16,21}}	{{7,7,9,9,9,9},{5,5,5,6,6,6},{4,4,4,4,4,4}}	{0,1,2,4}	{{8,8,13,13,13,20},{5,5,9,9,10,14},{3,3,3,5,5,7},{2,2,3,3,3,4}}	{{4,4,7,7,7,7},{3,3,5,5,5,5},{2,2,2,2,2,2},{1,1,1,1,1,1}}	f
2	6lb	{{12,20,20,24,24,32},{8,13,13,16,16,21},{6,10,10,12,12,16}}	{{4,4,5,5,8,12},{3,3,3,3,5,8},{2,2,3,3,4,6}}	{0,1,2,3}	{{6,10,10,12,12,16},{4,7,7,8,8,11},{2,2,2,3,3,5},{2,2,3,4,4,6}}	{{3,3,5,5,6,8},{2,2,3,3,5,5},{1,1,1,1,2,2},{1,1,2,2,2,3}}	f
3	Light Guns	{{10,15,15,18,18,24},{4,6,6,8,8,10}}	{{2,3,3,3,5,8},{0,1,1,1,2,5}}	{0,1}	{{4,6,6,8,8,8},{3,4,4,4,5,7}}	{{1,2,3,3,4,5},{1,1,1,2,2,3}}	f
4	Howitzer	{{0,0,0,0,0,0},{5,7,7,8,8,11},{3,5,5,6,6,8}}	{{0,0,0,0,0,0},{3,3,4,4,5,7},{2,2,3,3,3,5}}	{0,1,2,3}	{{0,0,0,0,0,0},{3,5,5,6,6,8},{2,4,4,5,5,6},{1,2,2,2,2,3}}	{{0,0,0,0,0,0},{2,2,3,3,3,5},{1,1,2,2,2,4},{0,0,1,1,1,2}}	t
\.


--
-- Name: gunnery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('gunnery_id_seq', 1, false);


--
-- Data for Name: inspiration; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY inspiration (id, name, effect) FROM stdin;
1	Charismatic	2
2	Dashing	1
3	Respected	0
4	Unlikable	-1
5	Detested	-2
\.


--
-- Name: inspiration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('inspiration_id_seq', 1, false);


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY login (user_id, date, ip_address, channel) FROM stdin;
1	2016-10-12 23:26:59.686421+10:30	[::1]:48256	1
1	2016-10-12 23:27:36.117291+10:30	[::1]:48364	1
1	2016-10-12 23:31:20.800798+10:30	[::1]:48730	1
1	2016-10-12 23:35:22.140267+10:30	[::1]:49120	1
1	2016-10-12 23:41:22.817671+10:30	[::1]:49590	1
1	2016-10-12 23:52:59.648047+10:30	[::1]:50598	1
1	2016-10-13 00:00:25.886756+10:30	[::1]:51246	1
1	2016-10-13 00:05:56.30691+10:30	[::1]:51800	1
1	2016-10-13 00:18:05.130075+10:30	[::1]:52938	1
1	2016-10-13 00:19:17.239611+10:30	[::1]:53076	1
1	2016-10-13 00:20:51.822886+10:30	[::1]:53230	1
1	2016-10-13 00:22:31.750041+10:30	[::1]:53400	1
1	2016-10-13 00:30:56.710018+10:30	[::1]:53400	1
1	2016-10-13 00:32:04.90612+10:30	[::1]:54446	1
1	2016-10-13 00:32:16.794833+10:30	[::1]:54498	2
1	2016-10-13 00:35:53.879807+10:30	[::1]:54822	3
1	2016-10-13 00:36:58.601214+10:30	[::1]:54930	1
1	2016-10-13 00:53:32.904875+10:30	[::1]:56344	1
1	2016-10-13 00:55:16.763628+10:30	[::1]:56540	1
1	2016-10-13 00:55:51.602256+10:30	[::1]:56608	1
1	2016-10-13 00:56:13.463683+10:30	[::1]:56662	1
1	2016-10-13 01:06:59.080808+10:30	[::1]:57666	1
1	2016-10-13 01:20:21.325119+10:30	[::1]:58786	1
1	2016-10-13 01:20:50.555347+10:30	[::1]:58878	1
1	2016-10-13 01:23:13.070141+10:30	[::1]:59040	1
1	2016-10-13 01:25:05.14555+10:30	[::1]:59254	1
1	2016-10-13 01:26:12.116858+10:30	[::1]:59370	1
1	2016-10-13 01:29:14.180238+10:30	[::1]:59628	1
1	2016-10-13 01:31:53.622227+10:30	[::1]:59874	1
1	2016-10-13 01:40:01.126176+10:30	[::1]:60556	1
1	2016-10-13 01:43:38.189416+10:30	[::1]:60896	1
1	2016-10-13 01:47:08.828013+10:30	[::1]:32968	1
1	2016-10-13 01:48:54.773+10:30	[::1]:33136	1
1	2016-10-13 01:51:29.015742+10:30	[::1]:33374	1
1	2016-10-13 02:04:47.857762+10:30	[::1]:34466	1
1	2016-10-13 02:05:25.03052+10:30	[::1]:34574	1
1	2016-10-13 02:06:11.81404+10:30	[::1]:34666	2
1	2016-10-13 02:18:07.75527+10:30	[::1]:35618	1
1	2016-10-13 02:20:41.18272+10:30	[::1]:35876	1
1	2016-10-13 02:22:06.29642+10:30	[::1]:36006	1
1	2016-10-13 02:23:41.592536+10:30	[::1]:36146	1
1	2016-10-13 02:27:14.318715+10:30	[::1]:36422	1
1	2016-10-13 03:06:45.517827+10:30	[::1]:39644	1
1	2016-10-13 03:08:24.624386+10:30	[::1]:39894	1
1	2016-10-13 03:24:40.956238+10:30	[::1]:41384	1
1	2016-10-13 03:25:36.631725+10:30	[::1]:41520	1
1	2016-10-13 03:29:12.692289+10:30	[::1]:41702	1
1	2016-10-13 03:31:24.303036+10:30	[::1]:42006	1
1	2016-10-13 03:33:41.149817+10:30	[::1]:42206	1
1	2016-10-13 03:35:50.248042+10:30	[::1]:42354	1
1	2016-10-13 11:31:18.832289+10:30	127.0.0.1:48948	1
1	2016-10-13 11:33:21.31689+10:30	127.0.0.1:49152	1
1	2016-10-13 11:37:52.232066+10:30	127.0.0.1:49228	1
1	2016-10-13 11:44:43.810825+10:30	127.0.0.1:50150	1
1	2016-10-13 11:45:55.473509+10:30	127.0.0.1:50308	1
1	2016-10-13 11:48:49.857402+10:30	127.0.0.1:50614	1
1	2016-10-13 11:50:24.488859+10:30	127.0.0.1:50796	1
1	2016-10-13 11:51:50.605548+10:30	127.0.0.1:50932	1
1	2016-10-13 11:57:23.597872+10:30	127.0.0.1:51374	1
1	2016-10-13 11:58:06.057944+10:30	127.0.0.1:51486	1
1	2016-10-13 12:01:17.023718+10:30	127.0.0.1:51774	1
1	2016-10-13 12:02:25.206696+10:30	127.0.0.1:51880	1
1	2016-10-13 12:03:08.511512+10:30	127.0.0.1:51952	1
1	2016-10-13 12:03:44.938071+10:30	127.0.0.1:52042	1
1	2016-10-13 12:27:37.586528+10:30	127.0.0.1:53972	1
1	2016-10-13 12:30:55.193022+10:30	127.0.0.1:54298	1
1	2016-10-13 12:31:39.900518+10:30	127.0.0.1:54382	1
1	2016-10-13 12:32:27.810173+10:30	127.0.0.1:54466	1
1	2016-10-13 12:32:48.311835+10:30	127.0.0.1:54532	2
1	2016-10-13 12:33:18.855874+10:30	127.0.0.1:54590	1
1	2016-10-13 13:59:30.921813+10:30	127.0.0.1:33372	1
1	2016-10-13 14:01:34.25583+10:30	127.0.0.1:33372	1
1	2016-10-13 14:03:08.006377+10:30	127.0.0.1:33372	1
1	2016-10-13 14:04:02.423565+10:30	127.0.0.1:33372	1
1	2016-10-13 14:29:48.258432+10:30	127.0.0.1:36006	1
1	2016-10-13 14:33:31.835241+10:30	127.0.0.1:36358	1
1	2016-10-13 14:35:02.373569+10:30	127.0.0.1:36520	1
1	2016-10-13 14:38:19.615376+10:30	127.0.0.1:36794	1
1	2016-10-13 14:41:02.837713+10:30	127.0.0.1:37046	1
1	2016-10-13 14:43:32.8563+10:30	127.0.0.1:37280	1
1	2016-10-13 14:45:00.168689+10:30	127.0.0.1:37418	2
1	2016-10-13 14:47:15.976811+10:30	127.0.0.1:37632	1
1	2016-10-13 14:48:57.295428+10:30	127.0.0.1:37788	1
1	2016-10-13 14:49:38.121371+10:30	127.0.0.1:37874	1
1	2016-10-13 14:51:30.758406+10:30	127.0.0.1:38066	2
1	2016-10-13 14:54:43.87611+10:30	127.0.0.1:38508	1
1	2016-10-13 14:55:40.153822+10:30	127.0.0.1:38604	1
1	2016-10-13 14:57:52.530237+10:30	127.0.0.1:38826	1
1	2016-10-13 15:04:18.516262+10:30	127.0.0.1:39324	1
1	2016-10-13 15:05:20.453726+10:30	127.0.0.1:39456	1
1	2016-10-13 15:06:42.916952+10:30	127.0.0.1:39590	1
1	2016-10-13 15:20:30.849734+10:30	127.0.0.1:40714	1
1	2016-10-13 15:22:13.183816+10:30	127.0.0.1:40922	1
1	2016-10-13 15:23:09.042574+10:30	127.0.0.1:41022	1
1	2016-10-13 15:24:30.958757+10:30	127.0.0.1:41150	1
1	2016-10-13 15:50:28.715738+10:30	127.0.0.1:43202	1
1	2016-10-13 15:51:58.849172+10:30	127.0.0.1:43370	1
1	2016-10-13 15:52:56.881037+10:30	127.0.0.1:43476	1
1	2016-10-13 15:54:50.495654+10:30	127.0.0.1:43640	1
1	2016-10-13 16:01:30.167581+10:30	127.0.0.1:44166	1
1	2016-10-13 16:10:12.924324+10:30	127.0.0.1:44962	1
1	2016-10-13 16:11:02.211559+10:30	127.0.0.1:45042	1
1	2016-10-13 16:13:56.247565+10:30	127.0.0.1:45310	1
1	2016-10-13 16:15:18.473711+10:30	127.0.0.1:45448	1
1	2016-10-13 16:16:59.596493+10:30	127.0.0.1:45612	1
1	2016-10-13 16:21:00.986003+10:30	127.0.0.1:46412	1
1	2016-10-13 16:21:32.579544+10:30	127.0.0.1:46480	1
1	2016-10-13 16:23:07.117415+10:30	127.0.0.1:46644	1
2	2016-10-13 16:36:24.795911+10:30	192.168.1.105:41591	2
2	2016-10-13 16:37:29.688852+10:30	192.168.1.105:41647	2
2	2016-10-13 16:40:29.668174+10:30	192.168.1.105:41783	2
1	2016-10-13 16:40:41.632732+10:30	127.0.0.1:48578	1
1	2016-10-13 16:47:30.260398+10:30	127.0.0.1:49164	1
1	2016-10-13 17:10:11.617005+10:30	127.0.0.1:50992	1
1	2016-10-13 17:19:05.876383+10:30	127.0.0.1:51822	1
1	2016-10-13 17:20:03.338827+10:30	127.0.0.1:51822	1
1	2016-10-13 17:23:05.634204+10:30	127.0.0.1:52162	1
1	2016-10-13 17:32:58.332112+10:30	127.0.0.1:52984	1
1	2016-10-13 17:37:50.342193+10:30	192.168.1.101:46285	2
1	2016-10-13 18:03:33.775314+10:30	127.0.0.1:52984	1
1	2016-10-13 23:35:14.152618+10:30	127.0.0.1:53956	1
1	2016-10-13 23:38:50.344644+10:30	127.0.0.1:54314	1
1	2016-10-13 23:41:25.782975+10:30	127.0.0.1:54544	1
1	2016-10-13 23:47:19.327351+10:30	127.0.0.1:55012	1
1	2016-10-13 23:48:13.867695+10:30	127.0.0.1:55164	1
1	2016-10-14 00:12:18.790476+10:30	127.0.0.1:57166	1
1	2016-10-14 00:12:58.390599+10:30	127.0.0.1:57276	1
2	2016-10-14 00:14:22.797565+10:30	192.168.1.105:44785	2
2	2016-10-14 00:17:04.675116+10:30	192.168.1.105:44959	2
1	2016-10-14 00:19:46.909727+10:30	127.0.0.1:57878	1
1	2016-10-14 00:22:34.241192+10:30	127.0.0.1:58122	1
1	2016-10-14 00:23:07.087023+10:30	127.0.0.1:58210	3
1	2016-10-14 00:24:12.196319+10:30	127.0.0.1:58316	1
1	2016-10-14 00:29:41.42935+10:30	127.0.0.1:58774	1
1	2016-10-14 00:30:35.147287+10:30	127.0.0.1:58892	1
1	2016-10-14 00:32:50.818037+10:30	127.0.0.1:59088	1
1	2016-10-14 00:43:02.921124+10:30	127.0.0.1:59940	1
1	2016-10-14 00:45:44.457912+10:30	127.0.0.1:60214	1
1	2016-10-14 00:46:49.582993+10:30	127.0.0.1:60318	1
1	2016-10-14 00:47:54.287741+10:30	127.0.0.1:60430	1
1	2016-10-14 01:02:12.1283+10:30	127.0.0.1:33348	1
1	2016-10-14 01:04:11.627177+10:30	127.0.0.1:33566	1
1	2016-10-14 01:08:01.813609+10:30	127.0.0.1:33892	1
1	2016-10-14 01:10:08.511785+10:30	127.0.0.1:34088	1
1	2016-10-14 01:15:09.288501+10:30	127.0.0.1:34588	1
1	2016-10-14 01:15:28.248556+10:30	127.0.0.1:34588	1
1	2016-10-14 01:16:14.925943+10:30	127.0.0.1:34718	1
1	2016-10-14 01:18:01.776876+10:30	127.0.0.1:34882	1
1	2016-10-14 01:18:09.610449+10:30	127.0.0.1:34882	1
1	2016-10-14 01:18:19.584834+10:30	127.0.0.1:34882	1
1	2016-10-14 01:20:15.992299+10:30	127.0.0.1:35074	1
1	2016-10-14 01:47:36.172042+10:30	127.0.0.1:37160	1
1	2016-10-14 01:49:36.434785+10:30	127.0.0.1:37472	1
1	2016-10-14 01:51:38.20964+10:30	127.0.0.1:37664	1
1	2016-10-14 02:10:18.714035+10:30	127.0.0.1:39192	1
1	2016-10-14 02:11:04.109894+10:30	127.0.0.1:39312	1
1	2016-10-14 02:12:18.405197+10:30	127.0.0.1:39444	1
1	2016-10-14 02:13:22.139263+10:30	127.0.0.1:39558	1
1	2016-10-14 02:17:34.327356+10:30	127.0.0.1:39966	1
1	2016-10-14 02:19:02.581218+10:30	127.0.0.1:40116	1
1	2016-10-14 02:19:49.055267+10:30	127.0.0.1:40224	2
1	2016-10-14 02:20:25.14137+10:30	127.0.0.1:40286	1
1	2016-10-14 02:21:36.28524+10:30	127.0.0.1:40562	1
1	2016-10-14 02:22:22.104947+10:30	127.0.0.1:40638	1
1	2016-10-14 02:26:25.051021+10:30	127.0.0.1:40988	1
1	2016-10-14 02:27:18.449932+10:30	127.0.0.1:41080	1
1	2016-10-14 02:43:21.95231+10:30	127.0.0.1:42488	1
1	2016-10-14 02:45:32.439833+10:30	127.0.0.1:42708	1
1	2016-10-14 03:26:06.748304+10:30	127.0.0.1:46704	1
1	2016-10-14 03:39:20.397025+10:30	127.0.0.1:47824	1
1	2016-10-14 03:39:55.857691+10:30	127.0.0.1:47928	1
1	2016-10-14 03:56:23.503224+10:30	127.0.0.1:49258	1
1	2016-10-14 04:04:00.123444+10:30	127.0.0.1:49900	1
1	2016-10-14 04:06:08.108017+10:30	127.0.0.1:50132	1
1	2016-10-14 04:10:36.880324+10:30	127.0.0.1:50556	1
1	2016-10-14 04:24:26.799439+10:30	127.0.0.1:51830	1
1	2016-10-14 04:26:19.631679+10:30	127.0.0.1:51966	1
1	2016-10-14 04:30:49.011064+10:30	127.0.0.1:52376	1
1	2016-10-14 04:32:20.618407+10:30	127.0.0.1:52520	1
1	2016-10-14 04:33:51.587696+10:30	127.0.0.1:52680	1
1	2016-10-14 04:40:29.431757+10:30	127.0.0.1:53198	1
1	2016-10-14 05:12:57.126559+10:30	127.0.0.1:55988	1
1	2016-10-14 05:16:13.243865+10:30	127.0.0.1:56290	1
1	2016-10-14 05:18:52.062939+10:30	127.0.0.1:56518	1
1	2016-10-14 05:25:00.946819+10:30	127.0.0.1:57060	1
1	2016-10-14 05:26:58.606872+10:30	127.0.0.1:57282	1
1	2016-10-14 05:29:45.523215+10:30	127.0.0.1:57282	1
1	2016-10-14 05:30:36.381944+10:30	127.0.0.1:57282	1
1	2016-10-14 05:35:57.879216+10:30	127.0.0.1:58066	1
1	2016-10-14 05:47:51.227274+10:30	127.0.0.1:59080	1
1	2016-10-14 06:09:38.039228+10:30	127.0.0.1:60810	1
1	2016-10-14 06:14:45.206561+10:30	127.0.0.1:33020	1
1	2016-10-14 06:15:44.030453+10:30	127.0.0.1:33148	1
1	2016-10-14 06:17:58.39267+10:30	127.0.0.1:33326	1
1	2016-10-14 06:19:50.296671+10:30	127.0.0.1:33532	1
1	2016-10-14 06:23:29.833916+10:30	127.0.0.1:33832	1
1	2016-10-14 06:24:06.898423+10:30	127.0.0.1:33924	2
1	2016-10-14 06:25:52.279889+10:30	127.0.0.1:34058	1
1	2016-10-14 06:32:20.47637+10:30	127.0.0.1:34592	1
1	2016-10-14 06:34:19.784645+10:30	127.0.0.1:34800	1
1	2016-10-14 06:39:36.796127+10:30	127.0.0.1:35232	1
1	2016-10-14 06:46:26.871616+10:30	127.0.0.1:35838	1
1	2016-10-14 06:53:35.076555+10:30	127.0.0.1:36384	1
1	2016-10-14 06:56:05.916841+10:30	127.0.0.1:36710	1
1	2016-10-14 06:58:33.594412+10:30	127.0.0.1:36976	1
1	2016-10-14 07:00:30.26438+10:30	127.0.0.1:37144	1
1	2016-10-14 07:05:17.61442+10:30	127.0.0.1:37542	1
1	2016-10-14 07:07:10.814986+10:30	127.0.0.1:37700	1
1	2016-10-14 07:13:18.890573+10:30	127.0.0.1:38200	1
1	2016-10-14 07:16:36.389791+10:30	127.0.0.1:38510	1
1	2016-10-14 07:19:38.631596+10:30	127.0.0.1:38770	1
1	2016-10-14 07:27:19.346005+10:30	127.0.0.1:39394	1
1	2016-10-14 07:29:11.290625+10:30	127.0.0.1:39596	1
1	2016-10-14 07:33:01.790536+10:30	127.0.0.1:40240	1
1	2016-10-14 08:11:55.584997+10:30	127.0.0.1:43552	1
1	2016-10-14 13:02:16.633575+10:30	127.0.0.1:38634	1
1	2016-10-14 13:04:28.536182+10:30	127.0.0.1:38830	1
1	2016-10-14 13:06:44.61775+10:30	127.0.0.1:39082	1
1	2016-10-14 13:08:53.177493+10:30	127.0.0.1:39296	1
1	2016-10-14 13:10:30.838141+10:30	127.0.0.1:39380	1
1	2016-10-14 13:16:16.051754+10:30	127.0.0.1:40114	1
1	2016-10-14 13:23:06.986373+10:30	127.0.0.1:40456	1
1	2016-10-14 13:28:04.905905+10:30	127.0.0.1:41194	1
1	2016-10-14 13:29:43.229428+10:30	127.0.0.1:41382	1
1	2016-10-14 13:30:25.558415+10:30	127.0.0.1:41476	2
1	2016-10-14 13:31:24.878385+10:30	127.0.0.1:41588	1
1	2016-10-14 13:33:06.902678+10:30	127.0.0.1:41786	1
1	2016-10-14 13:34:01.385231+10:30	127.0.0.1:41910	1
1	2016-10-14 13:39:13.248433+10:30	127.0.0.1:42410	1
1	2016-10-14 13:40:02.492693+10:30	127.0.0.1:42558	1
1	2016-10-14 13:43:59.545342+10:30	127.0.0.1:43118	1
1	2016-10-14 13:44:26.795212+10:30	127.0.0.1:43200	2
1	2016-10-14 13:45:05.029392+10:30	127.0.0.1:43272	1
1	2016-10-14 13:45:28.133002+10:30	127.0.0.1:43338	2
1	2016-10-14 13:46:03.669482+10:30	127.0.0.1:43448	1
1	2016-10-14 14:17:43.714792+10:30	127.0.0.1:46262	1
1	2016-10-14 14:22:03.949196+10:30	127.0.0.1:46656	1
1	2016-10-14 14:26:31.058896+10:30	127.0.0.1:47060	1
1	2016-10-14 14:32:22.512558+10:30	127.0.0.1:47528	1
1	2016-10-14 14:34:49.921704+10:30	127.0.0.1:47776	1
1	2016-10-14 14:35:20.239382+10:30	127.0.0.1:47850	1
1	2016-10-14 14:38:39.821763+10:30	127.0.0.1:48122	1
1	2016-10-14 14:39:54.16981+10:30	127.0.0.1:48254	1
1	2016-10-14 14:50:27.769328+10:30	127.0.0.1:49168	1
1	2016-10-14 14:50:53.160222+10:30	127.0.0.1:49226	1
1	2016-10-14 14:57:50.851115+10:30	127.0.0.1:49792	1
1	2016-10-14 15:01:10.040849+10:30	127.0.0.1:50102	1
1	2016-10-14 15:04:47.829461+10:30	127.0.0.1:50400	1
1	2016-10-14 15:08:47.798964+10:30	127.0.0.1:50748	1
1	2016-10-14 15:13:08.72971+10:30	127.0.0.1:51132	1
1	2016-10-14 15:19:26.40323+10:30	127.0.0.1:51640	1
1	2016-10-14 15:21:20.823275+10:30	127.0.0.1:51870	1
1	2016-10-14 15:23:40.481218+10:30	127.0.0.1:52086	1
1	2016-10-14 15:25:04.487627+10:30	127.0.0.1:52232	1
1	2016-10-14 15:28:16.466499+10:30	127.0.0.1:52500	1
1	2016-10-14 15:29:06.936241+10:30	127.0.0.1:52600	2
1	2016-10-14 15:30:16.747894+10:30	127.0.0.1:52750	1
1	2016-10-14 16:09:17.795682+10:30	127.0.0.1:55938	1
1	2016-10-14 16:12:46.558233+10:30	127.0.0.1:56284	1
1	2016-10-14 16:36:07.443259+10:30	127.0.0.1:58710	1
1	2016-10-14 16:41:43.127211+10:30	127.0.0.1:59216	1
1	2016-10-14 16:42:17.825285+10:30	127.0.0.1:59342	2
1	2016-10-14 16:43:30.695415+10:30	127.0.0.1:59468	1
1	2016-10-14 16:44:12.200855+10:30	127.0.0.1:59540	1
1	2016-10-14 16:45:50.018469+10:30	127.0.0.1:59676	1
1	2016-10-14 16:49:17.94491+10:30	127.0.0.1:59962	1
1	2016-10-14 16:50:10.949788+10:30	127.0.0.1:60056	1
1	2016-10-14 16:52:23.229862+10:30	127.0.0.1:60274	1
1	2016-10-14 16:56:42.802513+10:30	127.0.0.1:60664	1
1	2016-10-14 16:57:57.902292+10:30	127.0.0.1:60786	1
1	2016-10-14 17:00:23.659684+10:30	127.0.0.1:60996	1
1	2016-10-14 17:04:09.345438+10:30	127.0.0.1:33100	2
1	2016-10-14 17:07:06.937973+10:30	127.0.0.1:33382	1
1	2016-10-14 17:08:53.044346+10:30	127.0.0.1:33526	1
1	2016-10-14 17:30:34.620447+10:30	127.0.0.1:35502	1
1	2016-10-14 17:31:47.477431+10:30	127.0.0.1:35662	1
1	2016-10-14 17:36:21.084375+10:30	127.0.0.1:36062	1
1	2016-10-14 17:38:00.019263+10:30	127.0.0.1:36240	1
1	2016-10-14 17:44:53.980332+10:30	127.0.0.1:36866	1
1	2016-10-14 17:48:19.335486+10:30	127.0.0.1:37180	1
1	2016-10-14 17:54:13.492207+10:30	127.0.0.1:37682	1
1	2016-10-14 17:56:09.998375+10:30	127.0.0.1:37900	2
1	2016-10-14 17:56:46.978033+10:30	127.0.0.1:38000	3
1	2016-10-14 18:01:40.633366+10:30	127.0.0.1:38454	1
1	2016-10-14 18:03:00.70295+10:30	127.0.0.1:38592	1
1	2016-10-14 18:04:11.155175+10:30	127.0.0.1:38716	1
1	2016-10-14 18:06:16.36706+10:30	127.0.0.1:38854	1
1	2016-10-14 18:35:08.666976+10:30	127.0.0.1:42576	1
1	2016-10-14 19:07:36.518836+10:30	127.0.0.1:45300	1
1	2016-10-14 19:10:35.676608+10:30	127.0.0.1:45510	1
1	2016-10-14 19:12:16.748802+10:30	127.0.0.1:45736	1
1	2016-10-14 19:17:03.505615+10:30	127.0.0.1:46080	1
1	2016-10-14 19:22:31.998198+10:30	127.0.0.1:46614	1
1	2016-10-14 19:26:34.49004+10:30	127.0.0.1:47006	1
1	2016-10-14 19:27:18.051969+10:30	127.0.0.1:47100	2
1	2016-10-14 19:29:45.64951+10:30	127.0.0.1:47362	1
1	2016-10-14 19:45:26.248961+10:30	127.0.0.1:48542	1
1	2016-10-14 20:12:35.461906+10:30	127.0.0.1:51120	1
1	2016-10-14 20:19:13.705212+10:30	127.0.0.1:51702	1
1	2016-10-14 20:19:33.454666+10:30	127.0.0.1:51786	2
1	2016-10-14 20:21:19.966791+10:30	127.0.0.1:52008	1
2	2016-10-14 20:22:11.286858+10:30	192.168.1.105:50008	2
1	2016-10-14 20:38:04.198827+10:30	127.0.0.1:53450	1
1	2016-10-14 20:45:53.650187+10:30	127.0.0.1:54060	1
1	2016-10-15 06:17:22.569156+10:30	127.0.0.1:44014	1
1	2016-10-15 06:25:54.251344+10:30	127.0.0.1:44838	1
1	2016-10-15 06:30:56.21691+10:30	127.0.0.1:45280	1
1	2016-10-15 06:57:48.878489+10:30	127.0.0.1:47590	1
1	2016-10-15 07:03:05.678585+10:30	127.0.0.1:48110	1
1	2016-10-15 07:04:02.32717+10:30	127.0.0.1:48226	1
1	2016-10-15 07:06:53.166336+10:30	127.0.0.1:48512	1
1	2016-10-15 08:07:12.973586+10:30	127.0.0.1:54044	1
1	2016-10-15 08:09:57.514605+10:30	127.0.0.1:54348	2
1	2016-10-15 08:11:50.345377+10:30	127.0.0.1:54550	1
1	2016-10-15 08:20:34.592312+10:30	127.0.0.1:56018	2
1	2016-10-15 08:29:22.481985+10:30	127.0.0.1:56794	1
1	2016-10-15 08:35:54.048992+10:30	127.0.0.1:57382	1
1	2016-10-15 08:39:13.324077+10:30	127.0.0.1:57832	1
1	2016-10-15 08:45:16.240859+10:30	127.0.0.1:58370	1
1	2016-10-15 08:46:50.025152+10:30	127.0.0.1:58566	1
1	2016-10-15 09:01:55.402563+10:30	127.0.0.1:59788	1
1	2016-10-15 09:04:23.913528+10:30	127.0.0.1:60042	1
1	2016-10-15 09:12:03.394107+10:30	127.0.0.1:60646	1
1	2016-10-15 09:13:43.284927+10:30	127.0.0.1:60820	1
1	2016-10-15 09:18:26.630621+10:30	127.0.0.1:33014	1
1	2016-10-15 09:27:26.417509+10:30	127.0.0.1:33770	1
1	2016-10-15 09:32:18.864519+10:30	127.0.0.1:34244	1
1	2016-10-15 09:39:16.940275+10:30	127.0.0.1:34948	1
1	2016-10-15 09:42:59.338615+10:30	127.0.0.1:35320	1
1	2016-10-15 09:53:03.753359+10:30	127.0.0.1:36152	1
1	2016-10-15 09:58:27.929267+10:30	127.0.0.1:36626	1
1	2016-10-15 10:00:46.109403+10:30	127.0.0.1:36878	1
1	2016-10-15 10:02:31.007187+10:30	127.0.0.1:37032	1
1	2016-10-15 10:06:48.271169+10:30	127.0.0.1:37422	1
1	2016-10-15 10:13:54.446306+10:30	127.0.0.1:38010	1
1	2016-10-15 10:19:22.771554+10:30	127.0.0.1:38534	1
1	2016-10-15 10:20:30.464376+10:30	127.0.0.1:38680	1
1	2016-10-15 10:23:22.38721+10:30	127.0.0.1:38680	1
1	2016-10-15 10:27:36.329639+10:30	127.0.0.1:39298	1
1	2016-10-15 10:30:36.142438+10:30	127.0.0.1:39646	1
1	2016-10-15 10:36:08.91514+10:30	127.0.0.1:40218	1
1	2016-10-15 10:36:46.064617+10:30	127.0.0.1:40218	1
1	2016-10-15 10:44:38.273997+10:30	127.0.0.1:40976	1
1	2016-10-15 10:45:13.987914+10:30	127.0.0.1:41106	2
1	2016-10-15 10:46:48.631336+10:30	127.0.0.1:41252	1
1	2016-10-15 10:49:47.101739+10:30	127.0.0.1:41494	1
1	2016-10-15 10:53:15.368819+10:30	127.0.0.1:41846	1
1	2016-10-15 10:57:53.058577+10:30	127.0.0.1:42242	1
1	2016-10-15 10:59:39.309414+10:30	127.0.0.1:42408	1
1	2016-10-15 11:00:53.082114+10:30	127.0.0.1:42568	1
1	2016-10-15 11:01:18.617516+10:30	127.0.0.1:42640	2
1	2016-10-15 11:10:43.219344+10:30	127.0.0.1:45750	1
1	2016-10-15 11:11:55.50065+10:30	127.0.0.1:45944	1
1	2016-10-15 11:14:51.295773+10:30	127.0.0.1:46236	1
1	2016-10-15 11:24:30.433105+10:30	127.0.0.1:47212	1
1	2016-10-15 11:43:33.032527+10:30	127.0.0.1:48824	1
1	2016-10-15 11:44:38.888277+10:30	127.0.0.1:48952	1
1	2016-10-15 11:45:01.482319+10:30	127.0.0.1:49028	2
1	2016-10-15 11:46:21.439524+10:30	127.0.0.1:49178	1
1	2016-10-15 11:49:37.075149+10:30	127.0.0.1:49494	1
1	2016-10-15 11:51:36.726554+10:30	127.0.0.1:49688	1
1	2016-10-15 11:53:34.898688+10:30	127.0.0.1:49886	1
1	2016-10-15 11:53:51.735956+10:30	127.0.0.1:49886	1
1	2016-10-15 12:11:16.777911+10:30	127.0.0.1:51802	1
1	2016-10-15 12:22:26.410379+10:30	127.0.0.1:53012	1
1	2016-10-15 12:30:47.111164+10:30	127.0.0.1:53012	1
1	2016-10-15 12:35:52.615847+10:30	127.0.0.1:54284	1
1	2016-10-15 12:40:22.353466+10:30	127.0.0.1:54770	2
1	2016-10-15 12:41:23.65155+10:30	127.0.0.1:54906	1
1	2016-10-15 12:43:29.135816+10:30	127.0.0.1:55048	1
1	2016-10-15 12:47:12.287944+10:30	127.0.0.1:55450	1
1	2016-10-15 12:48:19.545891+10:30	127.0.0.1:55570	1
1	2016-10-15 12:48:51.995548+10:30	127.0.0.1:55642	1
1	2016-10-15 12:49:57.838704+10:30	127.0.0.1:55766	1
1	2016-10-15 12:50:49.907454+10:30	127.0.0.1:55874	1
1	2016-10-15 12:51:52.8082+10:30	127.0.0.1:55984	1
1	2016-10-15 12:52:51.745592+10:30	127.0.0.1:56096	1
1	2016-10-15 12:57:16.307703+10:30	127.0.0.1:56492	1
1	2016-10-15 12:59:33.845952+10:30	127.0.0.1:56492	1
1	2016-10-15 13:02:26.059069+10:30	127.0.0.1:56980	1
1	2016-10-15 13:43:20.657637+10:30	127.0.0.1:60388	1
1	2016-10-15 13:53:07.960156+10:30	127.0.0.1:60802	1
1	2016-10-15 14:06:21.979055+10:30	127.0.0.1:34106	1
1	2016-10-15 14:07:37.481905+10:30	127.0.0.1:34360	1
1	2016-10-15 14:10:39.1708+10:30	127.0.0.1:34630	1
1	2016-10-15 14:21:14.300741+10:30	127.0.0.1:34970	1
1	2016-10-15 14:24:50.539004+10:30	127.0.0.1:35976	1
\.


--
-- Data for Name: oob_224_game_446; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY oob_224_game_446 (path, commander, inf, cav, art) FROM stdin;
I_Corps	Yorckk	4000	100	2
I_Corps.7_Bde	Yaxxman	200	100	8
I_Corps.7_Bde.2nd_Silesian	Blitzenburg	6000	300	8
I_Corps.7_Bde.4th_Silesian	Blitzenburg	8000	100	12
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY orders (id, name, min_rank, objective, enemy_unit, friendly_unit) FROM stdin;
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('orders_id_seq', 1, false);


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY rating (id, name, code, shock, form_close, form_engage, sk_close, attack_superior, attack_guns, fire_bonus, melee_bonus, ammo) FROM stdin;
1	Guard	Guard	t	t	t	t	t	t	1	2	10
2	Grenadier	Grend	t	t	t	t	t	t	1	2	9
3	Elite	Elite	f	t	t	t	t	t	1	1	8
4	Crack Line	Crack	f	t	t	f	t	t	1	1	7
5	Regular Line	Reglr	f	f	t	f	t	t	0	0	7
6	Reserve Line	2ndLn	f	f	f	f	t	t	0	0	6
7	Conscript	Consr	f	f	f	f	f	t	0	-1	6
8	Landwehr	Landw	f	f	f	f	f	f	-1	-1	5
9	Militia	Milit	f	f	f	f	f	f	0	-1	7
10	Rabble	Mob	t	f	f	f	t	f	-2	-2	2
\.


--
-- Name: rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('rating_id_seq', 1, false);


--
-- Data for Name: scenario; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY scenario (id, campaign_id, author_id, created, forked_from, name, descr, notes, year, public, latlon, red_team, red_brief, blue_team, blue_brief) FROM stdin;
2	0	1	2016-10-12 23:21:45.213973+10:30	0	Wagram	Napoleon vs ArchDuke Charles clash near Vienna in a truly massive series of Battle of Epic proportions. 		1809	t	\N				
3	0	1	2016-10-12 23:21:45.213973+10:30	0	Bussaco	Wellington vs Masssena in Portugal, a classic Big Battle Campaign in the Peninsula (featuring the 95th Rifles).		1810	t	\N				
4	0	2	2016-10-12 23:21:45.213973+10:30	0	Leipzig	Napoleon vs The Rest of the World as he makes yet another miraculous comeback after the disasters in Russia.		1813	t	\N				
5	0	2	2016-10-12 23:21:45.213973+10:30	0	Waterloo	Napoleon vs Wellington, after he makes yet another miraculous comeback after escaping from the Island of Elba.		1815	t	\N				
1	0	1	2016-10-12 23:21:45.213973+10:30	0	Jena Auerstadt	Napoleon's Blitzkrieg tears into Prussia.	The twin battles of Jena and Auerstedt (older name: Auerstädt) were fought on 14 October 1806 on the plateau west of the river Saale in today's Germany, between the forces of Napoleon I of France and Frederick William III of Prussia. The decisive defeat suffered by the Prussian Army subjugated the Kingdom of Prussia to the French Empire until the Sixth Coalition was formed in 1812.\n\nBoth armies were split into separate parts. The Prussian Army was in a very poor state. Brunswick was 71 years old while his field commanders were in their 60s. The Prussian army was still using tactics and training of Frederick The Great. Its greatest weakness was its staff organization. Most of the divisions were poorly organized and did not communicate well with each other. The Prussians had three forces:\n\n49,800 under Karl Wilhelm Ferdinand, Duke of Brunswick\n38,000 under Friedrich Ludwig, Fürst zu Hohenlohe-Ingelfingen\n15,000 under Ernst von Rüchel\nThe Grand Armée loved their Emperor and their generals. The army was very experienced and was very well led, with a good mix of older, more experienced Marshals, and younger, upcoming Marshals. Napoleon's main force at Jena consisted of about 53,000 men in total:\n\nNicolas Jean de Dieu Soult's IV Corps\nJean Lannes' V Corps\nMichel Ney's VI Corps\nPierre Augereau's VII Corps\nThe cavalry of Joachim Murat\nFurther north, in the vicinity of Auerstedt, the French forces were Jean-Baptiste Bernadotte's I Corps (20,000 strong)[citation needed] and Louis Nicolas Davout's III Corps (27,000)	1806	t	\N	France - Napoleon	Advance on a wide front with dispersed Corps.\n\nLocate the part of the Prussian Army, then converge Corps to attain local superiority.	Prussia - Frederick William III	Marche in goode order to meet the French, where upon the Army shall give battle, and put an ende to the ambitions of that so-called  "Great"  amateur soldier.
\.


--
-- Name: scenario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('scenario_id_seq', 10, true);


--
-- Data for Name: scenario_unit; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY scenario_unit (id, cmd_id, path, name, nation, utype, condition, cmd_level, drill, bayonets, small_arms, elite_arms, lt_coy, jg_coy, rating, sabres, cav_type, cav_rating, guns, gunnery_type, gun_condition) FROM stdin;
\.


--
-- Name: scenario_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('scenario_unit_id_seq', 1, false);


--
-- Data for Name: screnario; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY screnario (id, campaign_id, author, created, forked_from, name, descr, year, latlon, red_team, red_brief, blue_team, blue_brief) FROM stdin;
\.


--
-- Name: screnario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('screnario_id_seq', 1, false);


--
-- Data for Name: small_arms; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY small_arms (id, name, ranges, effects, covered) FROM stdin;
1	Muskets	{1,2,4,6}	{{15,20,20,30,30,40},{8,12,15,20,20,30},{4,8,8,15,15,20},{1,4,4,8,8,10}}	{{5,7,7,10,10,14},{3,5,5,7,7,10},{2,3,3,5,5,7},{1,2,2,3,3,4}}
2	Skirmishers	{1,2,4,6}	{{12,16,16,25,25,30},{6,12,15,16,16,20},{3,6,6,12,12,15},{1,3,3,6,6,8}}	{{3,4,5,8,10,18},{2,4,4,5,5,7},{1,2,2,4,4,5},{0,1,1,2,2,2}}
3	Rifles	{2,4,6,8}	{{8,12,15,20,20,24},{4,8,8,15,15,20},{2,4,4,8,8,10},{1,2,2,4,4,5}}	{{4,8,8,10,10,12},{2,4,4,8,8,10},{1,2,2,4,4,6},{0,1,1,2,2,3}}
\.


--
-- Name: small_arms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('small_arms_id_seq', 1, false);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: stdimg; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY stdimg (id, code, name, photo, preview, thumb) FROM stdin;
1	PDF		data:image/jpeg;base64,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0AG0do2jtABsbACbdw2jtKAbR2jaO0AG0dpNo7UKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//Z	data:image/gif;base64,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	data:image/gif;base64,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
\.


--
-- Name: stdimg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('stdimg_id_seq', 1, false);


--
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY unit (id, cmd_id, path, name, nation, utype, cmd_level, drill, bayonets, small_arms, elite_arms, lt_coy, jg_coy, rating, sabres, cav_type, cav_rating, guns, gunnery_type, gun_condition) FROM stdin;
\.


--
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('unit_id_seq', 1, false);


--
-- Data for Name: user_rego; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY user_rego (user_id, created, expires, charge, receipt) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY users (id, username, passwd, name, email, rank, created, expires, channel, ip_address, country, bloglink, notes, banned, disqus, newsletter) FROM stdin;
2	kat	fysherdog	Kat Formato	kformato@gmail.com	1	2016-10-12 23:21:42.685479+10:30	2016-10-12 23:21:42.685479+10:30	0	192.168.1.105:50008	Australia	http://witchwoodstudio.com		f	t	t
1	steveoc64	unx911zxx	Steve O'Connor	steveoc64@gmail.com	10	2016-10-12 10:30:00+10:30	2016-10-12 10:30:00+10:30	1	127.0.0.1:35976	Australia	http://15mm-madness.blogspot.com		f	f	t
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: utype; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY utype (id, name) FROM stdin;
1	Command
2	Infantry Brigade
3	Cavalry Brigade
4	Artillery Battery
5	Other Detachment
\.


--
-- Name: utype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('utype_id_seq', 1, false);


--
-- Data for Name: vcode; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY vcode (uid, code, expires) FROM stdin;
\.


--
-- Name: army_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY army
    ADD CONSTRAINT army_pkey PRIMARY KEY (id);


--
-- Name: cav_type_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY cav_type
    ADD CONSTRAINT cav_type_pkey PRIMARY KEY (id);


--
-- Name: cmd_action_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY cmd_action
    ADD CONSTRAINT cmd_action_pkey PRIMARY KEY (id);


--
-- Name: cmd_level_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY cmd_level
    ADD CONSTRAINT cmd_level_pkey PRIMARY KEY (id);


--
-- Name: cmd_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY cmd_rating
    ADD CONSTRAINT cmd_rating_pkey PRIMARY KEY (id);


--
-- Name: condition_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY condition
    ADD CONSTRAINT condition_pkey PRIMARY KEY (id);


--
-- Name: drill_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY drill
    ADD CONSTRAINT drill_pkey PRIMARY KEY (id);


--
-- Name: force_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY force
    ADD CONSTRAINT force_pkey PRIMARY KEY (id);


--
-- Name: force_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY force_unit
    ADD CONSTRAINT force_unit_pkey PRIMARY KEY (id);


--
-- Name: game_cmd_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY game_cmd
    ADD CONSTRAINT game_cmd_pkey PRIMARY KEY (id);


--
-- Name: game_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);


--
-- Name: game_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY game_unit
    ADD CONSTRAINT game_unit_pkey PRIMARY KEY (id);


--
-- Name: gt_formation_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY gt_formation
    ADD CONSTRAINT gt_formation_pkey PRIMARY KEY (id);


--
-- Name: gunnery_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY gunnery
    ADD CONSTRAINT gunnery_pkey PRIMARY KEY (id);


--
-- Name: inspiration_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY inspiration
    ADD CONSTRAINT inspiration_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: rating_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id);


--
-- Name: scenario_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY scenario
    ADD CONSTRAINT scenario_pkey PRIMARY KEY (id);


--
-- Name: scenario_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY scenario_unit
    ADD CONSTRAINT scenario_unit_pkey PRIMARY KEY (id);


--
-- Name: screnario_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY screnario
    ADD CONSTRAINT screnario_pkey PRIMARY KEY (id);


--
-- Name: small_arms_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY small_arms
    ADD CONSTRAINT small_arms_pkey PRIMARY KEY (id);


--
-- Name: stdimg_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY stdimg
    ADD CONSTRAINT stdimg_pkey PRIMARY KEY (id);


--
-- Name: unit_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (id);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: utype_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY utype
    ADD CONSTRAINT utype_pkey PRIMARY KEY (id);


--
-- Name: vcode_pkey; Type: CONSTRAINT; Schema: public; Owner: steve; Tablespace: 
--

ALTER TABLE ONLY vcode
    ADD CONSTRAINT vcode_pkey PRIMARY KEY (uid);


--
-- Name: army_campaign_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX army_campaign_idx ON army USING btree (campaign_id);


--
-- Name: force_scenario_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX force_scenario_idx ON force USING btree (scenario_id);


--
-- Name: force_unit_force_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX force_unit_force_idx ON force_unit USING btree (force_id);


--
-- Name: game_cmd_game_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX game_cmd_game_idx ON game_cmd USING btree (game_id);


--
-- Name: game_cmd_order_cmd_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX game_cmd_order_cmd_idx ON game_cmd_order USING btree (cmd_id);


--
-- Name: game_cmd_order_game_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX game_cmd_order_game_idx ON game_cmd_order USING btree (game_id);


--
-- Name: game_cmd_player_cmd_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE UNIQUE INDEX game_cmd_player_cmd_idx ON game_cmd_player USING btree (cmd_id, player_id);


--
-- Name: game_cmd_player_player_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE UNIQUE INDEX game_cmd_player_player_idx ON game_cmd_player USING btree (player_id, cmd_id);


--
-- Name: game_player_game_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE UNIQUE INDEX game_player_game_idx ON game_players USING btree (game_id, player_id);


--
-- Name: game_player_player_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE UNIQUE INDEX game_player_player_idx ON game_players USING btree (player_id, game_id);


--
-- Name: game_scenario_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX game_scenario_idx ON game USING btree (scenario_id);


--
-- Name: game_unit_cmd_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX game_unit_cmd_idx ON game_unit USING btree (cmd_id);


--
-- Name: login_date_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX login_date_idx ON login USING btree (date);


--
-- Name: login_user_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX login_user_idx ON login USING btree (user_id);


--
-- Name: scenario_author_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX scenario_author_idx ON scenario USING btree (author_id);


--
-- Name: scenario_unit_cmd_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX scenario_unit_cmd_idx ON scenario_unit USING btree (cmd_id);


--
-- Name: unit_cmd_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX unit_cmd_idx ON unit USING btree (cmd_id);


--
-- Name: user_rego_idx; Type: INDEX; Schema: public; Owner: steve; Tablespace: 
--

CREATE INDEX user_rego_idx ON user_rego USING btree (user_id, created);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

