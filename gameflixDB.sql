
drop table likecontent;

create table gamecontent(
    id number,
    title nvarchar2(40),
    description nvarchar2(200),
    imagelink nvarchar2(200),
    videolink nvarchar2(200),
    downloadlink nvarchar2(200),
    category nvarchar2(20),
    updatetime date default sysdate,
    CONSTRAINT gamecontent_PK primary key(id)
);

create table members(
    userid nvarchar2(20),
    userpwd nvarchar2(20),
    username nvarchar2(40),
    phoneno varchar2(15),
    address nvarchar2(50),
    email nvarchar2(40),
    category nvarchar2(20),
    CONSTRAINT members_PK primary key(userid)
);
    
create table likecontent(
    userid nvarchar2(20),
    contentid number,
    CONSTRAINT likecontent_PK primary key(userid,contentid),
    CONSTRAINT likecontent_FK FOREIGN KEY (contentid) REFERENCES gamecontent(id),
    CONSTRAINT likeuser_FK FOREIGN KEY (userid) REFERENCES members(userid)
);
create table board(
    id number,
    title nvarchar2(50),
    description nvarchar2(200),
    num_check nvarchar2(50),
    writer nvarchar2(40),
    regdate date default sysdate,
    CONSTRAINT board_PK primary key(id),
    CONSTRAINT board_FK FOREIGN KEY (writer) REFERENCES members(userid)
);

create SEQUENCE gamecontent_seq start with 1 nocache;
create SEQUENCE board_seq start with 1 nocache;

insert into gamecontent
values(gamecontent_seq.nextval, 
    'ARK: Survival Evolved', 
    '�ź��� �� �⽾�� ���� �� ����� ��Ƴ��� ���� ������մϴ�. ����� ��Ȱ���� ����Ͽ� ���� ���� �ٴϴ� ���� ������ ���̰ų� ����̰� �ٸ� �÷��̾�� ���� �����ϰ� �����ϰ� Ż���Ͻʽÿ�!',
    'images/ARK_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256744539/movie480.webm?t=1551899542',
    'https://store.steampowered.com/app/346110/ARK_Survival_Evolved/',
    '�׼�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Assassin''s Creed�� Odyssey', 
    'Assassin''s Creed�� Odyssey���� ����� ����� ������ ���ʽÿ�. �����ڿ��� ����ִ� ������ �Ǳ����, �� ������ ���󰡸� ����� ���ſ� ������ ����� �������� ��� �׸����� ����� �ٲپ�� �մϴ�.',
    'images/Assassin.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256730995/movie480.webm?t=1538547062',
    'https://store.steampowered.com/app/812140/Assassins_Creed_Odyssey/',
    '�׼�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'PLAYERUNKNOWN''S BATTLEGROUNDS', 
    'PLAYERUNKNOWN��S BATTLEGROUNDS�� ��Ʋ�ξ� ��������, �ܵ� ������ �� 100���� �÷��̾ �پ��� ����� ������ �̿��Ͽ� ������ 1���� ��Ƴ��� �������� ������ �ϰ� �˴ϴ�.',
    'images/Battlegrond_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256793553/movie480_vp9.webm?t=1595992300',
    'https://store.steampowered.com/app/578080/PLAYERUNKNOWNS_BATTLEGROUNDS/',
    '�׼�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Sid Meier��s Civilization�� VI', 
    '���� VI ������ ���ο� ������� ����� �����ϰ�, ������ ���並 Ȯ���Ű��, ��ȭ�� ������Ű��, ����� ������ �����ڵ鿡 �¼� �������� ���ӵ� ������ ������ �Ǽ��غ� �� �ֽ��ϴ�. Ŭ������Ʈ�� ����� 20���� ���� �� �����ڵ� �� �Ѹ����� �÷��� �غ�����.',
    'images/Civilization_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256672703/movie480.webm?t=1476737110',
    'https://store.steampowered.com/app/289070/Sid_Meiers_Civilization_VI/',
    '����', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Dead by Daylight', 
    '���� ���� ���̶���Ʈ�� �� ���� �÷��̾ �����ڸ� ���ϰ� ���̷��� ������ ���θ��� ������ ����ϰ�, ������ �� ���� �÷��̾�� ���θ��κ��� ����ġ���� �����ڷ� �÷����ϴ� (4vs1) �������� �Դϴ�.',
    'images/Daybyday_Img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256800232/movie480_vp9.webm?t=1600097821',
    'https://store.steampowered.com/app/381210/Dead_by_Daylight/',
    '�׼�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Desperados III', 
    'Desperados III�� ���丮 �߽��� �ϵ��ھ� ���� ���� �������� ���ں��� ���� �ô븦 ������� �������ϴ�. ��Ƴ����� ���ѿ� ���� ������� �� �� ���� ����� � ��ȹ�� ���������� ���̴� �����ϰ� �÷����ϼ���.',
    'images/Desperado3_Img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256791353/movie480_vp9.webm?t=1593527053',
    'https://store.steampowered.com/app/610370/Desperados_III/',
    '����', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Don''t Starve', 
    'Don''t Starve�� ���а� �������� ������ Ÿ������ �ʴ� �߻� ���� �����Դϴ�. �̻��� ����, ���� �� �������� ���� �� �̻��ϰ� ������ ����� ���ʽÿ�. �ڿ��� ��Ƽ� ���� ��Ÿ�Ͽ� �´� �����۰� �������� ���弼��.',
    'images/Don''tStarve_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/2028889/movie480.webm?t=1447358243',
    'https://store.steampowered.com/app/219740/Dont_Starve/',
    '�ε�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    '�巡�ﺼ Z īī��Ʈ', 
    '�巡�ﺼ Z īī��Ʈ���� ������ Z ������� �̾߱⸦ ü���϶�! ������ ����� ������ ����, ����, ����, �����Ϳ� �ٸ� ĳ���͵�� �Բ� �ο��, �����ϰ�, �԰�, �Ʒ��ϸ� �巡�ﺼ Z�� ���迡�� ��ư���.',
    'images/dragonball.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256773292/movie480.webm?t=1579881659',
    'https://store.steampowered.com/app/851850/_Z/',
    '�׼�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Journey', 
    '����� �ź��� Journey�� ���踦 Ž���ϰ� ������ Ž���ϰ� �縷�� Ž���ϸ� �� ����� �߰��ϼ���.',
    'images/Journey_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256780780/movie480.webm?t=1591891852',
    'https://store.steampowered.com/app/638230/Journey/',
    '�ε�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Monster Hunter World: Iceborne', 
    '���ο� ������ ��. ����϶�, ���ɿ� ����! �ø��� �ֽ��� Monster Hunter: World������ ���Ӱ� ���۵� �پ��� ������ ���°谡 ��� ������ ���迡�� �ñ��� ��� ��Ȱ�� ü���� �� �ֽ��ϴ�.',
    'images/monsterHunter.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256803091/movie480_vp9.webm?t=1601537956',
    'https://store.steampowered.com/app/582010/Monster_Hunter_World/',
    '�׼�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    '���ǽ� �������� 4', 
    '�������� 4�� ��ȭ�� ���ǽ� ���� �׼�! ���ǽ� �������� 4�� ������ ���ǽ��� ���� ü���� �ܼ�Ʈ�� ������ �������ֿ����� �Ұ����ߴ� ���ο� ��Ҹ� ��Ƴ��鼭 ���ݱ��� �̻����� ȣ���ϰ� ���ο� ���ǽ� ���� �׼��� �����߽��ϴ�!',
    'images/onepiece.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256770440/movie480.webm?t=1582104055',
    'https://store.steampowered.com/app/1089090/__4/',
    '�׼�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Ori and the Will of the Wisps', 
    '�Ŵ��ϰ� �̱����� ���迡�� ���ο� ������ �����ϼ���. ������ ����� �������鼭 ������ ����� ����� ������ ������ �� ���Դϴ�.',
    'images/ori_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256779902/movie480.webm?t=1585866497',
    'https://store.steampowered.com/app/1057090/Ori_and_the_Will_of_the_Wisps/',
    '�׼�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Oxygen Not Included', 
    'Oxygen Not Included�� ���� �Ĺ��� �ùķ��̼� �����Դϴ�. �ܰ� ���� ���� ����� ������ �������� �¹����� ������ �����ϰ�, �̻��� ���ο� ����ü�� �غ��ϰ�, ���� ���� ����� Ȱ���Ͽ� �����ϰ� �����ؾ��մϴ�.',
    'images/OxygenNotIncluded_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256757654/movie480.webm?t=1564503300',
    'https://store.steampowered.com/app/457140/Oxygen_Not_Included/',
    '����', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Persona 4 Golden', 
    '���ΰ��� ���� ģ������ ���� ���� ������� ���۵Ǵ� ������ ���� �����ϴ� �̾߱� �ӿ��� ���ɻ簡 ���� ģ���� ������, �ҼӰ��� ������ ������ ��ο� ��� �����ϴ� ������ ��ܺ�����.',
    'images/p4g_Img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256787612/movie480_vp9.webm?t=1594307995',
    'https://store.steampowered.com/app/1113000/Persona_4_Golden/',
    '����', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Sekiro��: Shadows Die Twice', 
    'Dark Souls �ø�� ������ FromSoftware�� ���ο� ��庥ó���� ������ ���� �ڽŸ��� ���� ��ô�غ��ʽÿ�. �����Ͻʽÿ�. ���� ȸ���Ͻʽÿ�. ������ �ο�ʽÿ�.',
    'images/Sekiro.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256770769/movie480.webm?t=1576898083',
    'https://store.steampowered.com/app/814380/Sekiro_Shadows_Die_Twice/',
    '�׼�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Skul: The Hero Slayer', 
    'Skul: The Hero Slayer�� 2D �α׶���Ʈ �׼� �÷����� �����Դϴ�. ���ռ� ��� �ð��ִ� ���� ���̷��� ������ �ΰ��鿡�� �������� ������ ���ϱ� ���� ���� ���谡 �׸��� �������� Ȧ�� �¼� �ο�� �����մϴ�.',
    'images/Skul.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256786021/movie480_vp9.webm?t=1589958808',
    'https://store.steampowered.com/app/1147560/Skul_The_Hero_Slayer/',
    '�ε�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Stardew Valley', 
    'Stardew Valley���� �Ҿƹ����� ������ ���� ������ ���� �޾ҽ��ϴ�. �ռ� ������ ���� �� ���� ���� �� ����� ���ο� ���� �����ϱ� �����߽��ϴ�. ������ ��� �ڶ� ������ �����ϴ� ������ �ٲٴ� ���� ��� �� �ֽ��ϱ�?',
    'images/stardewvalley.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256660296/movie480.webm?t=1454099186',
    'https://store.steampowered.com/app/413150/Stardew_Valley/',
    '�ε�', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Total War: THREE KINGDOMS', 
    'Total War: Three Kingdoms�� ������ ���� ��¿� ������ ���� ����, Total War �ø����� ���� ��� �������Դϴ�.',
    'images/TotalWar.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256751447/movie480.webm?t=1558620943',
    'https://store.steampowered.com/app/779340/Total_War_THREE_KINGDOMS/',
    '����', default);