Return-Path: <sivas.srr@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sivas.srr@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43L2nf52nwzDqvg
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 18:04:54 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wBK74oSd070685
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 02:04:52 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2pg44vwr63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 02:04:51 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Thu, 20 Dec 2018 07:04:44 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 20 Dec 2018 07:04:41 -0000
Received: from us1a3-mail65.a3.dal09.isc4sb.com ([10.142.3.169])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2018122007044128-182343 ;
 Thu, 20 Dec 2018 07:04:41 +0000 
In-Reply-To: 
Subject: MoM of Test work group meeting:
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Thu, 20 Dec 2018 07:04:40 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17009-1541 | IBM Domino Build
 SCN1812108_20180501T0841_FP25 December 12, 2018 at 12:47
X-LLNOutbound: False
X-Disclaimed: 33475
X-TNEFEvaluated: 1
x-cbid: 18122007-6059-0000-0000-00000C98D92E
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.434296; ST=0; TS=0; UL=0; ISC=; MB=0.002173
X-IBM-SpamModules-Versions: BY=3.00010253; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000271; SDB=6.01134351; UDB=6.00589778; IPR=6.00914523; 
 BA=6.00006182; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00024763; XFM=3.00000015;
 UTC=2018-12-20 07:04:43
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-12-20 06:19:51 - 6.00009362
x-cbparentid: 18122007-6060-0000-0000-00004ECF3487
Message-Id: <OFCF85E95B.2C42F047-ON00258369.0025BD8D-00258369.0026E168@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-20_04:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2018 07:04:55 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Hi All,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Here with sending some important queries and MoM of 13 De=
c 2018&nbsp; meeting.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >It will be helpful if we get some test owners for followi=
ng functions which are getting ready from</div>
<div dir=3D"ltr" >Intel and Google.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >IPMI Inband code update - Google&nbsp; ( Nancy could you =
help here)</div>
<div dir=3D"ltr" >IPMI User management - Intel&nbsp; ( Anup could you help =
here )</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thank you folks in advance.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div><strong>MoM of Openbmc Test workgroup meeting on 13 =
Dec 2018:</strong></div>
<div>&nbsp;</div>
<div>Attendees:&nbsp; Rahul Maheswari, Kaushi Venkatesh, Joseph Reynolds, N=
ancy , Sivas</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Agenda:</div>
<div>&nbsp;</div>
<div><strong><u>Update on February Community Release from global openbmc ca=
ll. </u></strong></div>
<div>&nbsp;</div>
<div>No official functionality available for Feb Community Release.</div>
<div>Existing functions should be regressed especially GUI =E2=80=93 featur=
es like SNMP, network, which are recently added</div>
<div>&nbsp;</div>
<div>Nancy mentioned that Patrick almost done with his inband IPMI code upd=
ate.</div>
<div>Nancy will be checking with Patrick on progress. And Sivas requested t=
o have someone assigned for test will be good.</div>
<div>&nbsp;</div>
<div>Jan 7<sup>th</sup> is code progress and then we will do regression tes=
ting.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong><u>Release planning update:</u></strong></div>
<div>&nbsp;</div>
<div>Joseph going to represent test group as it happens around afternoon of=
 US time.</div>
<div>Sivas requested Joseph to have all the cell updated including availabi=
lity date <a href=3D"https://docs.google.com/spreadsheets/d/1lts-YX8J=5FAnS=
2dKfhW649OQHijz-JRiJWHTDpKY62Hk/edit?usp=3Dsharing" >https://docs.google.co=
m/spreadsheets/d/1lts-YX8J=5FAnS2dKfhW649OQHijz-JRiJWHTDpKY62Hk/edit?usp=3D=
sharing</a></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong><u>GUI Test meeting:</u></strong></div>
<div>&nbsp;</div>
<div>As Rahul, Kaushi, Arpana planning to work on GUI, Requested to have lo=
cal meeting and plan for GUI testing.</div>
<div>&nbsp;</div>
<div><strong><u>Security Test:</u></strong></div>
<div>&nbsp;</div>
<div>Joseph Reynolds planning to add additional test cases by Jan 1<sup>st<=
/sup> week.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong><u>Test work group meeting timing:</u></strong></div>
<div>&nbsp;</div>
<div>Team decided to meet from Jan 10<sup>th</sup> onwards and the same tim=
ing.</div>
<div>Sivas to send the invitation =E2=80=93 Action Item - Done</div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Google drive link: <a href=3D"https://docs.google.com/doc=
ument/d/1iRN61K1zo-lXHRn-KUhqx8Tugxccx9RiVa1oXPYKyAc/edit?usp=3Dsharing" >h=
ttps://docs.google.com/document/d/1iRN61K1zo-lXHRn-KUhqx8Tugxccx9RiVa1oXPYK=
yAc/edit?usp=3Dsharing</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Note: Wish you and your family a happy christmas and new =
year.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >With regards,</div>
<div dir=3D"ltr" >Sivas</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"" >----- Original message -----<br><br>&nbsp;
<div role=3D"region" ><div><div><div><div data-dojo-attach-point=3D"subject=
Node" ><h2 role=3D"heading" style=3D"font-weight: 300;margin: 0; max-width:=
 100%;font-size: 22px;line-height: 28px;padding-bottom:10px;color: #4b4b4c;=
" >OpenBMC Test Work group meeting: - Webex link: https://ibm.webex.com/mee=
t/sivas.srr Telephone access is: United States Toll Free 1-844-531-0958 (To=
ll - +1-669-234-1178) India Toll - 0(STD Code)-64800002 For eg. (Bengaluru =
- 080-64800002)</h2></div>
<div style=3D"font-size: 12px; white-space: nowrap;text-align: left;vertica=
l-align: top;font-weight: normal;color: #666;display: inline-block;padding-=
bottom:10px" ><div><span style=3D"font-weight: bold" >Chair: </span> <span>=
Sivas Srr/India/IBM</span></div>
<div style=3D"display:none" ><span style=3D"font-weight: bold" >Delegated t=
o: </span></div>
<div style=3D"display:none" ><span style=3D"font-weight: bold" >Send by: </=
span></div></div></div>
<div style=3D"font-size: 12px; white-space: nowrap;text-align: left;vertica=
l-align: top;font-weight: normal;color: #666;display: inline-block;padding-=
bottom:10px" ><div style=3D"display:none" ><span style=3D"font-weight: bold=
" >Comments from Sivas Srr:</span></div></div>
<div><div style=3D"font-size: 12px; white-space: nowrap;text-align: left;ve=
rtical-align: top;font-weight: normal;color: #666;display: inline-block;pad=
ding-bottom:10px" ><div><span style=3D"font-weight: bold" >Time: </span> <s=
pan>Thu, Dec 13, 2018 10:00 PM - 11:00 PM</span> <span style=3D"display:inl=
ine-block" >(applies to 2 instances)</span></div>
<div style=3D"display:block" ><span style=3D"font-weight: bold" >Location: =
</span> <span>United States Toll Free 1-844-531-0958 (Toll - +1-669-234-117=
8) India Toll - 0(STD Code)-64800002 For eg. (Bengaluru - 080-64800002) Pas=
scode: 928 662 307</span></div>
<div style=3D"display:none" ><span style=3D"font-weight: bold" >Room: </spa=
n></div>
<div style=3D"display:none" ><span style=3D"font-weight: bold" >Resource: <=
/span></div>
<div style=3D"display:block" ><span style=3D"font-weight: bold" >Online Mee=
ting name: </span> <span>OpenBMC Test Group meeting </span></div>
<div style=3D"display:block" ><span style=3D"font-weight: bold" >Online mee=
ting: </span> <span>https://ibm.webex.com/meet/sivas.srr</span></div>
<div style=3D"display:block" ><span style=3D"font-weight: bold" >Meeting ID=
: </span> <span>928 662 307</span></div>
<div style=3D"display:block" ><span style=3D"font-weight: bold" >Password: =
</span> <span>sivas</span></div></div>
<div style=3D"font-weight: normal;color: #666;font-size: 12px;line-height: =
17px;" ><div style=3D"white-space: nowrap;text-align: left;vertical-align: =
top;font-weight: normal;color: #666;display: inline-block; padding-bottom: =
10px; display: block" ><div><span style=3D"font-weight: bold" >Required:</s=
pan></div>
<div><span style=3D"padding-left: 20px;" >Andrew Geissler/Austin/IBM, anup.=
pandya@intel.com, Arpana M Durgaprasad/India/IBM, benjaminfair@google.com, =
bradleyb@fuzziesquirrel.com, Deepak Kodihalli/India/IBM, ed.tanous@intel.co=
m, George Keishing/India/IBM, Joseph Reynolds/Rochester/Contr/IBM, Kaushik =
Venkatesh/India/IBM, kurt.r.taylor@gmail.com, Maury Zipse/Rochester/IBM, Mi=
chael Walsh/Rochester/IBM, rahulmaheshwari01@gmail.com, Ravindra S Rao1/Ind=
ia/IBM, venture@google.com, yuenn@google.com</span></div></div>
<div data-dojo-attach-point=3D"optionalNode" style=3D"white-space: nowrap;t=
ext-align: left;vertical-align: top;font-weight: normal;color: #666;display=
: inline-block; padding-bottom: 10px; display: none" ><div><span style=3D"f=
ont-weight: bold" >Optional: </span></div>
<div>&nbsp;</div></div>
<div data-dojo-attach-point=3D"FYINode" style=3D"white-space: nowrap;text-a=
lign: left;vertical-align: top;font-weight: normal;color: #666;display: inl=
ine-block; padding-bottom: 10px; display: none" ><div><span style=3D"font-w=
eight: bold" >FYI: </span></div>
<div>&nbsp;</div></div></div>
<div><div data-dojo-attach-point=3D"descNode" ><div><span style=3D"font-wei=
ght: bold; font-size: 12px;line-height: 17px; white-space: nowrap;text-alig=
n: left; color: #666;" >Description:</span></div>
<div><div><span><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,H=
elvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,A=
rial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Ver=
dana,Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Ser=
if,Verdana,Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sa=
ns Serif,Verdana,Arial,Helvetica,sans-serif" >Note: Rescheduling this meeti=
ng to accommodate new members.</font></font></font></font></font></span></d=
iv>
<div>&nbsp;</div>
<div><span><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvet=
ica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,=
Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,=
Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Ve=
rdana,Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Se=
rif,Verdana,Arial,Helvetica,sans-serif" >General Agenda:</font></font></fon=
t></font></font></span></div>
<div>&nbsp;</div>
<div><span><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvet=
ica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,=
Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,=
Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Ve=
rdana,Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Se=
rif,Verdana,Arial,Helvetica,sans-serif" >- Recap of last instance and solut=
ion</font></font></font></font></font></span></div>
<div><span><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvet=
ica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,=
Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,=
Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Ve=
rdana,Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Se=
rif,Verdana,Arial,Helvetica,sans-serif" >- New Agenda / Issues to be discus=
sed - planned earlier</font></font></font></font></font></span></div>
<div><span><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvet=
ica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,=
Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,=
Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Ve=
rdana,Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Se=
rif,Verdana,Arial,Helvetica,sans-serif" >-&nbsp; Around the room</font></fo=
nt></font></font></font></span></div>
<div><span><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvet=
ica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,=
Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,=
Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Ve=
rdana,Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Se=
rif,Verdana,Arial,Helvetica,sans-serif" ><a href=3D"https://github.com/open=
bmc/openbmc/wiki/Test-work-group" target=3D"=5Fblank" >https://github.com/o=
penbmc/openbmc/wiki/Test-work-group</a></font></font></font></font></font><=
/span></div>
<div>&nbsp;</div>
<div><span><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvet=
ica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,=
Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,=
Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Ve=
rdana,Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Se=
rif,Verdana,Arial,Helvetica,sans-serif" >Agenda: 23 Aug 2018</font></font><=
/font></font></font></span></div>
<div>&nbsp;</div>
<ul>        <li><span><font size=3D"2" face=3D"Default Sans Serif,Verdana,A=
rial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Ver=
dana,Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Ser=
if,Verdana,Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Default Sa=
ns Serif,Verdana,Arial,Helvetica,sans-serif" ><font size=3D"2" face=3D"Defa=
ult Sans Serif,Verdana,Arial,Helvetica,sans-serif" >New member introduction=
 if any</font></font></font></font></font></span></li>        <li><span><fo=
nt size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif=
" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans=
-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvetic=
a,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,He=
lvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Ar=
ial,Helvetica,sans-serif" >Auto test plan generation using robot framework =
( <a href=3D"https://github.com/openbmc/openbmc-test-automation/blob/master=
/tools/generate=5Ftest=5Fdocument" target=3D"=5Fblank" >https://github.com/=
openbmc/openbmc-test-automation/blob/master/tools/generate=5Ftest=5Fdocumen=
t )</a></font></font></font></font></font></span></li>        <li><span><fo=
nt size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif=
" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans=
-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvetic=
a,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,He=
lvetica,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Ar=
ial,Helvetica,sans-serif" >Do we need to create explicit test plan document=
?</font></font></font></font></font></span></li>        <li><span><font siz=
e=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" ><fo=
nt size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif=
" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans=
-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,Helvetic=
a,sans-serif" ><font size=3D"2" face=3D"Default Sans Serif,Verdana,Arial,He=
lvetica,sans-serif" >Dynamic CI discussion</font></font></font></font></fon=
t></span></li></ul>
<div>&nbsp;</div></div></div></div></div></div></div></div></blockquote></d=
iv><BR>
