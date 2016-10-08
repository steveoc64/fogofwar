truncate campaign restart identity;
copy campaign(author,name,year,descr) from stdin;
1	Jena Auerstadt	1806	Napoleon\'s Blitzkrieg tears into Prussia.
1	Wagram	1809	Napoleon vs ArchDuke Charles clash near Vienna in a truly massive series of Battle of Epic proportions. 
1	Bussaco	1810	Wellington vs Masssena in Portugal, a classic Big Battle Campaign in the Peninsula (featuring the 95th Rifles).
1	Leipzig	1813	Napoleon vs The Rest of the World as he makes yet another miraculous comeback after the disasters in Russia.
1	Waterloo	1815	Napoleon vs Wellington, after he makes yet another miraculous comeback after escaping from the Island of Elba.
\.
select * from campaign;