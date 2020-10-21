
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
    '신비한 섬 기슭에 좌초 된 당신은 살아남는 법을 배워야합니다. 당신의 교활함을 사용하여 땅을 돌아 다니는 원시 생물을 죽이거나 길들이고 다른 플레이어와 만나 생존하고 지배하고 탈출하십시오!',
    'images/ARK_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256744539/movie480.webm?t=1551899542',
    'https://store.steampowered.com/app/346110/ARK_Survival_Evolved/',
    '액션', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Assassin''s Creed® Odyssey', 
    'Assassin''s Creed® Odyssey에서 당신의 운명을 시험해 보십시오. 낙오자에서 살아있는 전설이 되기까지, 긴 여정을 따라가며 당신의 과거에 숨겨진 비밀을 밝혀내고 고대 그리스의 운명을 바꾸어야 합니다.',
    'images/Assassin.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256730995/movie480.webm?t=1538547062',
    'https://store.steampowered.com/app/812140/Assassins_Creed_Odyssey/',
    '액션', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'PLAYERUNKNOWN''S BATTLEGROUNDS', 
    'PLAYERUNKNOWN’S BATTLEGROUNDS는 배틀로얄 게임으로, 외딴 섬에서 총 100명의 플레이어가 다양한 무기와 전략을 이용하여 마지막 1명이 살아남는 순간까지 전투를 하게 됩니다.',
    'images/Battlegrond_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256793553/movie480_vp9.webm?t=1595992300',
    'https://store.steampowered.com/app/578080/PLAYERUNKNOWNS_BATTLEGROUNDS/',
    '액션', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Sid Meier’s Civilization® VI', 
    '문명 VI 에서는 새로운 방식으로 세상과 소통하고, 제국의 영토를 확장시키며, 문화를 발전시키고, 역사속 위대한 지도자들에 맞서 오래도록 지속될 나만의 문명을 건설해볼 수 있습니다. 클레오파트라를 비롯한 20명의 역사 속 지도자들 중 한명으로 플레이 해보세요.',
    'images/Civilization_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256672703/movie480.webm?t=1476737110',
    'https://store.steampowered.com/app/289070/Sid_Meiers_Civilization_VI/',
    '전략', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Dead by Daylight', 
    '데드 바이 데이라이트는 한 명의 플레이어가 생존자를 고문하고 죽이려는 잔학한 살인마의 역할을 담당하고, 나머지 네 명의 플레이어는 살인마로부터 도망치려는 생존자로 플레이하는 (4vs1) 공포게임 입니다.',
    'images/Daybyday_Img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256800232/movie480_vp9.webm?t=1600097821',
    'https://store.steampowered.com/app/381210/Dead_by_Daylight/',
    '액션', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Desperados III', 
    'Desperados III는 스토리 중심의 하드코어 전략 잠입 게임으로 무자비한 서부 시대를 배경으로 펼쳐집니다. 살아남을지 권총에 의해 사라질지 이 두 가지 결론은 어떤 계획을 세웠느냐의 차이니 현명하게 플레이하세요.',
    'images/Desperado3_Img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256791353/movie480_vp9.webm?t=1593527053',
    'https://store.steampowered.com/app/610370/Desperados_III/',
    '전략', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Don''t Starve', 
    'Don''t Starve는 과학과 마법으로 가득한 타협하지 않는 야생 생존 게임입니다. 이상한 생물, 위험 및 놀라움으로 가득 찬 이상하고 미지의 세계로 들어가십시오. 자원을 모아서 생존 스타일에 맞는 아이템과 구조물을 만드세요.',
    'images/Don''tStarve_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/2028889/movie480.webm?t=1447358243',
    'https://store.steampowered.com/app/219740/Dont_Starve/',
    '인디', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    '드래곤볼 Z 카카로트', 
    '드래곤볼 Z 카카로트에서 오공과 Z 전사들의 이야기를 체험하라! 원작의 장대한 전투는 물론, 오공, 오반, 베지터와 다른 캐릭터들과 함께 싸우고, 낚시하고, 먹고, 훈련하며 드래곤볼 Z의 세계에서 살아가자.',
    'images/dragonball.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256773292/movie480.webm?t=1579881659',
    'https://store.steampowered.com/app/851850/_Z/',
    '액션', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Journey', 
    '고대의 신비한 Journey의 세계를 탐험하고 유적을 탐험하고 사막을 탐사하며 그 비밀을 발견하세요.',
    'images/Journey_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256780780/movie480.webm?t=1591891852',
    'https://store.steampowered.com/app/638230/Journey/',
    '인디', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Monster Hunter World: Iceborne', 
    '새로운 생명의 땅. 사냥하라, 본능에 따라! 시리즈 최신작 Monster Hunter: World에서는 새롭게 제작된 다양한 지형과 생태계가 살아 숨쉬는 세계에서 궁극의 사냥 생활을 체험할 수 있습니다.',
    'images/monsterHunter.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256803091/movie480_vp9.webm?t=1601537956',
    'https://store.steampowered.com/app/582010/Monster_Hunter_World/',
    '액션', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    '원피스 해적무쌍 4', 
    '해적무쌍 4란 진화한 원피스 무쌍 액션! 원피스 해적무쌍 4는 리얼한 원피스의 전장 체험을 콘셉트로 기존의 해적무쌍에서는 불가능했던 새로운 요소를 담아내면서 지금까지 이상으로 호쾌하고 새로운 원피스 무쌍 액션을 실현했습니다!',
    'images/onepiece.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256770440/movie480.webm?t=1582104055',
    'https://store.steampowered.com/app/1089090/__4/',
    '액션', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Ori and the Will of the Wisps', 
    '거대하고 이국적인 세계에서 새로운 여정을 시작하세요. 오리의 운명을 밝혀내면서 강력한 적들과 어려운 퍼즐을 만나게 될 것입니다.',
    'images/ori_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256779902/movie480.webm?t=1585866497',
    'https://store.steampowered.com/app/1057090/Ori_and_the_Will_of_the_Wisps/',
    '액션', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Oxygen Not Included', 
    'Oxygen Not Included는 우주 식민지 시뮬레이션 게임입니다. 외계 우주 바위 깊숙한 곳에서 부지런한 승무원은 과학을 습득하고, 이상한 새로운 생명체를 극복하고, 놀라운 우주 기술을 활용하여 생존하고 번영해야합니다.',
    'images/OxygenNotIncluded_img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256757654/movie480.webm?t=1564503300',
    'https://store.steampowered.com/app/457140/Oxygen_Not_Included/',
    '전략', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Persona 4 Golden', 
    '주인공과 그의 친구들이 연쇄 살인 사건으로 시작되는 모험을 통해 성장하는 이야기 속에서 관심사가 같은 친구를 만나고, 소속감을 느끼며 내면의 어두운 면과 갈등하는 경험을 즐겨보세요.',
    'images/p4g_Img.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256787612/movie480_vp9.webm?t=1594307995',
    'https://store.steampowered.com/app/1113000/Persona_4_Golden/',
    '전략', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Sekiro™: Shadows Die Twice', 
    'Dark Souls 시리즈를 개발한 FromSoftware의 새로운 어드벤처에서 복수를 향한 자신만의 길을 개척해보십시오. 복수하십시오. 명예를 회복하십시오. 무사답게 싸우십시오.',
    'images/Sekiro.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256770769/movie480.webm?t=1576898083',
    'https://store.steampowered.com/app/814380/Sekiro_Shadows_Die_Twice/',
    '액션', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Skul: The Hero Slayer', 
    'Skul: The Hero Slayer는 2D 로그라이트 액션 플랫포머 게임입니다. 마왕성 경비를 맡고있는 꼬마 스켈레톤 스컬은 인간들에게 붙잡혀간 마왕을 구하기 위해 용사와 모험가 그리고 제국군에 홀로 맞서 싸우기 시작합니다.',
    'images/Skul.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256786021/movie480_vp9.webm?t=1589958808',
    'https://store.steampowered.com/app/1147560/Skul_The_Hero_Slayer/',
    '인디', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Stardew Valley', 
    'Stardew Valley에서 할아버지의 오래된 농장 부지를 물려 받았습니다. 손수 도구와 동전 몇 개로 무장 한 당신은 새로운 삶을 시작하기 시작했습니다. 땅에서 살며 자란 들판을 번성하는 집으로 바꾸는 법을 배울 수 있습니까?',
    'images/stardewvalley.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256660296/movie480.webm?t=1454099186',
    'https://store.steampowered.com/app/413150/Stardew_Valley/',
    '인디', default);
insert into gamecontent
values(gamecontent_seq.nextval, 
    'Total War: THREE KINGDOMS', 
    'Total War: Three Kingdoms는 수많은 수상 경력에 빛나는 전략 게임, Total War 시리즈의 역사 배경 차기작입니다.',
    'images/TotalWar.jpg',
    'https://steamcdn-a.akamaihd.net/steam/apps/256751447/movie480.webm?t=1558620943',
    'https://store.steampowered.com/app/779340/Total_War_THREE_KINGDOMS/',
    '전략', default);