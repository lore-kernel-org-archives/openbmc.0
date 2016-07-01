Return-Path: <vishwanath@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgmnn55xGzDqlg
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 16:33:32 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u616XTGM128345
 for <openbmc@lists.ozlabs.org>; Fri, 1 Jul 2016 02:33:31 -0400
Received: from e28smtp02.in.ibm.com (e28smtp02.in.ibm.com [125.16.236.2])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23wj3kj46k-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 01 Jul 2016 02:33:30 -0400
Received: from localhost
 by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Fri, 1 Jul 2016 12:03:21 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
 by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 1 Jul 2016 12:03:18 +0530
X-IBM-Helo: d28dlp03.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
 by d28dlp03.in.ibm.com (Postfix) with ESMTP id C1A0D125805B
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 12:05:59 +0530 (IST)
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u616WH8F17170696
 for <openbmc@lists.ozlabs.org>; Fri, 1 Jul 2016 12:02:18 +0530
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Fri, 1 Jul 2016 00:33:14 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Fri, 1 Jul 2016 00:33:12 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Fri, 1 Jul 2016 06:33:11 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 1 Jul 2016 06:33:08 -0000
X-IBM-Helo: us1a3-smtp01.a3.dal06.isc4sb.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org; assign@noreply.github.com;
 openbmc@noreply.github.com
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016070106330764-109013 ;
 Fri, 1 Jul 2016 06:33:07 +0000 
MIME-Version: 1.0
In-Reply-To: <openbmc/openbmc/issues/428/229849203@github.com>
Subject: Re: [openbmc/openbmc] CORE and DIMM Present value as False (#428)
To: OpenBMC <openbmc@lists.ozlabs.org>
Cc: Assign <assign@noreply.github.com>, openbmc/openbmc
 <openbmc@noreply.github.com>
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Fri, 1 Jul 2016 11:43:01 +0530
References: <openbmc/openbmc/issues/428@github.com>
 <openbmc/openbmc/issues/428/229849203@github.com>
X-KeepSent: 5671C8AC:BE51B507-65257FE3:002207C5;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1 October 14, 2013
X-LLNOutbound: False
X-Disclaimed: 48111
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF570DFB181558f9e8a93df938690918cEABBF570DFB18155"
x-cbid: 16070106-0004-0000-0000-000002B8023B
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.056843; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005447; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000172; SDB=6.00724058; UDB=6.00338407; UTC=2016-07-01
 06:33:10
x-cbparentid: 16070106-5102-0000-0000-00000034B1E6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF5671C8AC.BE51B507-ON65257FE3.002207C5-65257FE3.002226AC@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-01_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607010063
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jul 2016 06:33:34 -0000

--0__=EABBF570DFB181558f9e8a93df938690918cEABBF570DFB18155
Content-type: multipart/alternative; 
	Boundary="1__=EABBF570DFB181558f9e8a93df938690918cEABBF570DFB18155"


--1__=EABBF570DFB181558f9e8a93df938690918cEABBF570DFB18155
Content-Transfer-Encoding: base64
Content-type: text/plain; charset=UTF-8

U2l2YXMsDQoNClByZXNlbnQgYml0IGZvciBDT1JFIGFuZCBESU1NIGFyZSB0byBiZSB1cGRhdGVk
IGJ5IEhCLg0KDQpUaGFua3MNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpUaGFu
a3MgYW5kIFJlZ2FyZHMsDQpWaXNod2FuYXRoLg0KQWR2aXNvcnkgU29mdHdhcmUgRW5naW5lZXIs
DQpQb3dlciBGaXJtd2FyZSBEZXZlbG9wbWVudCwNClN5c3RlbXMgJlRlY2hub2xvZ3kgTGFiLA0K
TUcyLTZGLTI1NSAsIE1hbnlhdGEgRW1iYXNzeSBCdXNpbmVzcyBQYXJrLA0KQmFuZ2Fsb3JlICwg
S0EgLCA1NjAwNDUNClBoOiArOTEtODAtNDY2NzgyNTUNCkUtbWFpbDogdmlzaHdhbmF0aEBpbi5p
Ym0uY29tDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCg0KDQpGcm9tOglzaXZhc3NyciA8
bm90aWZpY2F0aW9uc0BnaXRodWIuY29tPg0KVG86CW9wZW5ibWMvb3BlbmJtYyA8b3BlbmJtY0Bu
b3JlcGx5LmdpdGh1Yi5jb20+DQpDYzoJVmlzaHdhbmF0aGEgU3ViYmFubmEvSW5kaWEvSUJNQElC
TUlOLCBBc3NpZ24NCiAgICAgICAgICAgIDxhc3NpZ25Abm9yZXBseS5naXRodWIuY29tPg0KRGF0
ZToJMDcvMDEvMjAxNiAwOTozNSBBTQ0KU3ViamVjdDoJUmU6IFtvcGVuYm1jL29wZW5ibWNdIENP
UkUgYW5kIERJTU0gUHJlc2VudCB2YWx1ZSBhcyBGYWxzZQ0KICAgICAgICAgICAgKCM0MjgpDQoN
Cg0KDQp3aXRoIHRoZSBsYXRlc3QgbGV2ZWwgKEp1biAzMCBidWlsZCApIC0gSGVyZSBpcyB0aGUg
b3V0cHV0Lg0KU2l2YXNzLU1CUDp+IHNpdmFzJCBjdXJsIC1jIGNqYXIgLWIgY2phciAtaw0KaHR0
cHM6Ly85LjMuMjMuMzIvb3JnL29wZW5ibWMvaW52ZW50b3J5L2VudW1lcmF0ZQ0Kew0KImRhdGEi
OiB7DQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0iOiB7DQoiZmF1bHQiOiAiRmFsc2Ui
LA0KImZydV90eXBlIjogIlNZU1RFTSIsDQoiaXNfZnJ1IjogMSwNCiJwcmVzZW50IjogIlRydWUi
LA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9iaW9z
Ijogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJTWVNURU0iLA0KImlzX2ZydSI6
IDEsDQoicHJlc2VudCI6ICJUcnVlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1j
L2ludmVudG9yeS9zeXN0ZW0vY2hhc3NpcyI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5
cGUiOiAiU1lTVEVNIiwNCiJpc19mcnUiOiAxLA0KInByZXNlbnQiOiAiVHJ1ZSIsDQoidmVyc2lv
biI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvZmFuMCI6
IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiRkFOIiwNCiJpc19mcnUiOiAxLA0K
InByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52
ZW50b3J5L3N5c3RlbS9jaGFzc2lzL2ZhbjEiOiB7DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90
eXBlIjogIkZBTiIsDQoiaXNfZnJ1IjogMSwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9u
IjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9mYW4yIjog
ew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJGQU4iLA0KImlzX2ZydSI6IDEsDQoi
cHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZl
bnRvcnkvc3lzdGVtL2NoYXNzaXMvZmFuMyI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5
cGUiOiAiRkFOIiwNCiJpc19mcnUiOiAxLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24i
OiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL2ZhbjQiOiB7
DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIkZBTiIsDQoiaXNfZnJ1IjogMSwNCiJw
cmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVu
dG9yeS9zeXN0ZW0vY2hhc3Npcy9mYW41Ijogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlw
ZSI6ICJGQU4iLA0KImlzX2ZydSI6IDEsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6
ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvaGRkX2JhY2tw
bGFuZSI6IHsNCiJmYXVsdCI6ICJUcnVlIiwNCiJmcnVfdHlwZSI6ICJEQVVHSFRFUl9DQVJEIiwN
CiJpc19mcnUiOiAxLA0KInByZXNlbnQiOiAiVHJ1ZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9v
cmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvaW9fYm9hcmQiOiB7DQoiZmF1bHQi
OiAiRmFsc2UiLA0KImZydV90eXBlIjogIkRBVUdIVEVSX0NBUkQiLA0KImlzX2ZydSI6IDEsDQoi
cHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZl
bnRvcnkvc3lzdGVtL2NoYXNzaXMvaW9fYm9hcmQvcGNpZV9tZXp6MCI6IHsNCiJmYXVsdCI6ICJG
YWxzZSIsDQoiZnJ1X3R5cGUiOiAiUENJRV9DQVJEIiwNCiJpc19mcnUiOiAxLA0KInByZXNlbnQi
OiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5
c3RlbS9jaGFzc2lzL2lvX2JvYXJkL3BjaWVfbWV6ejEiOiB7DQoiZmF1bHQiOiAiRmFsc2UiLA0K
ImZydV90eXBlIjogIlBDSUVfQ0FSRCIsDQoiaXNfZnJ1IjogMSwNCiJwcmVzZW50IjogIkZhbHNl
IiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hh
c3Npcy9pb19ib2FyZC9wY2llX3Nsb3QwIjogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlw
ZSI6ICJQQ0lFX0NBUkQiLA0KImlzX2ZydSI6IDEsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVy
c2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvaW9f
Ym9hcmQvcGNpZV9zbG90MF9yaXNlciI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUi
OiAiUENJRV9SSVNFUiIsDQoiaXNfZnJ1IjogMSwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJz
aW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9pb19i
b2FyZC9wY2llX3Nsb3QxIjogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJQQ0lF
X0NBUkQiLA0KImlzX2ZydSI6IDEsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIi
DQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvaW9fYm9hcmQvcGNp
ZV9zbG90MV9yaXNlciI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiUENJRV9S
SVNFUiIsDQoiaXNfZnJ1IjogMSwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiIN
Cn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9pb19ib2FyZC9wY2ll
X3Nsb3QyIjogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJQQ0lFX0NBUkQiLA0K
ImlzX2ZydSI6IDEsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9v
cmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvaW9fYm9hcmQvcGNpZV9zbG90Ml9y
aXNlciI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiUENJRV9SSVNFUiIsDQoi
aXNfZnJ1IjogMSwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29y
Zy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZCI6IHsNCiJDdXN0
b20gRmllbGQgMSI6ICIiLA0KIkN1c3RvbSBGaWVsZCAyIjogIlJhY2tzcGFjZSBVUywgSW5jLiIs
DQoiQ3VzdG9tIEZpZWxkIDMiOiAiIiwNCiJDdXN0b20gRmllbGQgNCI6ICIiLA0KIkN1c3RvbSBG
aWVsZCA1IjogIiIsDQoiQ3VzdG9tIEZpZWxkIDYiOiAiIiwNCiJDdXN0b20gRmllbGQgNyI6ICIi
LA0KIkN1c3RvbSBGaWVsZCA4IjogIiIsDQoiUGFydCBOdW1iZXIiOiAiMDIwMzA1UjAwLTYwMC1H
IiwNCiJTZXJpYWwgTnVtYmVyIjogIjAyMDMwNVIwMFgxNTcxMDAxIiwNCiJUeXBlIjogMjMsDQoi
ZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIk1BSU5fUExBTkFSIiwNCiJpc19mcnUiOiAx
LA0KInByZXNlbnQiOiAiVHJ1ZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9p
bnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvYXBzcyI6IHsNCiJmYXVsdCI6ICJG
YWxzZSIsDQoiZnJ1X3R5cGUiOiAiTUFJTl9QTEFOQVIiLA0KImlzX2ZydSI6IDAsDQoicHJlc2Vu
dCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkv
c3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvYm1jIjogew0KImZhdWx0IjogIkZhbHNlIiwNCiJm
cnVfdHlwZSI6ICJCTUMiLA0KImlzX2ZydSI6IDAsDQoibWFudWZhY3R1cmVyIjogIkFTUEVFRCIs
DQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICJcInYxLjAtNDgtZzhkNDNhZWUtZGly
dHlcIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJi
b2FyZC9jcHUwIjogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJDUFUiLA0KImlz
X2ZydSI6IDEsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcv
b3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvY3B1MC9jb3JlMCI6
IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiQ09SRSIsDQoiaXNfZnJ1IjogMCwN
CiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2lu
dmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9jcHUwL2NvcmUxIjogew0KImZhdWx0
IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJDT1JFIiwNCiJpc19mcnUiOiAwLA0KInByZXNlbnQi
OiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5
c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL2NwdTAvY29yZTEwIjogew0KImZhdWx0IjogIkZhbHNl
IiwNCiJmcnVfdHlwZSI6ICJDT1JFIiwNCiJpc19mcnUiOiAwLA0KInByZXNlbnQiOiAiRmFsc2Ui
LA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFz
c2lzL21vdGhlcmJvYXJkL2NwdTAvY29yZTExIjogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVf
dHlwZSI6ICJDT1JFIiwNCiJpc19mcnUiOiAwLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNp
b24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhl
cmJvYXJkL2NwdTAvY29yZTIiOiB7DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIkNP
UkUiLA0KImlzX2ZydSI6IDAsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9
LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvY3B1
MC9jb3JlMyI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiQ09SRSIsDQoiaXNf
ZnJ1IjogMCwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9v
cGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9jcHUwL2NvcmU0Ijog
ew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJDT1JFIiwNCiJpc19mcnUiOiAwLA0K
InByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52
ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL2NwdTAvY29yZTUiOiB7DQoiZmF1bHQi
OiAiRmFsc2UiLA0KImZydV90eXBlIjogIkNPUkUiLA0KImlzX2ZydSI6IDAsDQoicHJlc2VudCI6
ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lz
dGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvY3B1MC9jb3JlNiI6IHsNCiJmYXVsdCI6ICJGYWxzZSIs
DQoiZnJ1X3R5cGUiOiAiQ09SRSIsDQoiaXNfZnJ1IjogMCwNCiJwcmVzZW50IjogIkZhbHNlIiwN
CiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Np
cy9tb3RoZXJib2FyZC9jcHUwL2NvcmU3Ijogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlw
ZSI6ICJDT1JFIiwNCiJpc19mcnUiOiAwLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24i
OiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJv
YXJkL2NwdTAvY29yZTgiOiB7DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIkNPUkUi
LA0KImlzX2ZydSI6IDAsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0K
Ii9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvY3B1MC9j
b3JlOSI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiQ09SRSIsDQoiaXNfZnJ1
IjogMCwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVu
Ym1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9jcHUxIjogew0KImZhdWx0
IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJDUFUiLA0KImlzX2ZydSI6IDEsDQoicHJlc2VudCI6
ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lz
dGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvY3B1MS9jb3JlMCI6IHsNCiJmYXVsdCI6ICJGYWxzZSIs
DQoiZnJ1X3R5cGUiOiAiQ09SRSIsDQoiaXNfZnJ1IjogMCwNCiJwcmVzZW50IjogIkZhbHNlIiwN
CiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Np
cy9tb3RoZXJib2FyZC9jcHUxL2NvcmUxIjogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlw
ZSI6ICJDT1JFIiwNCiJpc19mcnUiOiAwLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24i
OiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJv
YXJkL2NwdTEvY29yZTEwIjogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJDT1JF
IiwNCiJpc19mcnUiOiAwLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwN
CiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL2NwdTEv
Y29yZTExIjogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJDT1JFIiwNCiJpc19m
cnUiOiAwLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29w
ZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL2NwdTEvY29yZTIiOiB7
DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIkNPUkUiLA0KImlzX2ZydSI6IDAsDQoi
cHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZl
bnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvY3B1MS9jb3JlMyI6IHsNCiJmYXVsdCI6
ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiQ09SRSIsDQoiaXNfZnJ1IjogMCwNCiJwcmVzZW50Ijog
IkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0
ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9jcHUxL2NvcmU0Ijogew0KImZhdWx0IjogIkZhbHNlIiwN
CiJmcnVfdHlwZSI6ICJDT1JFIiwNCiJpc19mcnUiOiAwLA0KInByZXNlbnQiOiAiRmFsc2UiLA0K
InZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lz
L21vdGhlcmJvYXJkL2NwdTEvY29yZTUiOiB7DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBl
IjogIkNPUkUiLA0KImlzX2ZydSI6IDAsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6
ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9h
cmQvY3B1MS9jb3JlNiI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiQ09SRSIs
DQoiaXNfZnJ1IjogMCwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoi
L29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9jcHUxL2Nv
cmU3Ijogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJDT1JFIiwNCiJpc19mcnUi
OiAwLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5i
bWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL2NwdTEvY29yZTgiOiB7DQoi
ZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIkNPUkUiLA0KImlzX2ZydSI6IDAsDQoicHJl
c2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRv
cnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvY3B1MS9jb3JlOSI6IHsNCiJmYXVsdCI6ICJG
YWxzZSIsDQoiZnJ1X3R5cGUiOiAiQ09SRSIsDQoiaXNfZnJ1IjogMCwNCiJwcmVzZW50IjogIkZh
bHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0v
Y2hhc3Npcy9tb3RoZXJib2FyZC9kaW1tMCI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5
cGUiOiAiRElNTSIsDQoiaXNfZnJ1IjogMSwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9u
IjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJi
b2FyZC9kaW1tMSI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiRElNTSIsDQoi
aXNfZnJ1IjogMSwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29y
Zy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9kaW1tMTAiOiB7
DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIkRJTU0iLA0KImlzX2ZydSI6IDEsDQoi
cHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZl
bnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvZGltbTExIjogew0KImZhdWx0IjogIkZh
bHNlIiwNCiJmcnVfdHlwZSI6ICJESU1NIiwNCiJpc19mcnUiOiAxLA0KInByZXNlbnQiOiAiRmFs
c2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9j
aGFzc2lzL21vdGhlcmJvYXJkL2RpbW0xMiI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5
cGUiOiAiRElNTSIsDQoiaXNfZnJ1IjogMSwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9u
IjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJi
b2FyZC9kaW1tMTMiOiB7DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIkRJTU0iLA0K
ImlzX2ZydSI6IDEsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9v
cmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvZGltbTE0Ijog
ew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJESU1NIiwNCiJpc19mcnUiOiAxLA0K
InByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52
ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL2RpbW0xNSI6IHsNCiJmYXVsdCI6ICJG
YWxzZSIsDQoiZnJ1X3R5cGUiOiAiRElNTSIsDQoiaXNfZnJ1IjogMSwNCiJwcmVzZW50IjogIkZh
bHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0v
Y2hhc3Npcy9tb3RoZXJib2FyZC9kaW1tMTYiOiB7DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90
eXBlIjogIkRJTU0iLA0KImlzX2ZydSI6IDEsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lv
biI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVy
Ym9hcmQvZGltbTE3Ijogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJESU1NIiwN
CiJpc19mcnUiOiAxLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIv
b3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL2RpbW0xOCI6
IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiRElNTSIsDQoiaXNfZnJ1IjogMSwN
CiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2lu
dmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9kaW1tMTkiOiB7DQoiZmF1bHQiOiAi
RmFsc2UiLA0KImZydV90eXBlIjogIkRJTU0iLA0KImlzX2ZydSI6IDEsDQoicHJlc2VudCI6ICJG
YWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVt
L2NoYXNzaXMvbW90aGVyYm9hcmQvZGltbTIiOiB7DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90
eXBlIjogIkRJTU0iLA0KImlzX2ZydSI6IDEsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lv
biI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVy
Ym9hcmQvZGltbTIvZXZlbnQiOiB7DQoiZW5kcG9pbnRzIjogWw0KIi9vcmcvb3BlbmJtYy9yZWNv
cmRzL2V2ZW50cy8xMSINCl0NCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hh
c3Npcy9tb3RoZXJib2FyZC9kaW1tMjAiOiB7DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBl
IjogIkRJTU0iLA0KImlzX2ZydSI6IDEsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6
ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9h
cmQvZGltbTIxIjogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJESU1NIiwNCiJp
c19mcnUiOiAxLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3Jn
L29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL2RpbW0yMiI6IHsN
CiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiRElNTSIsDQoiaXNfZnJ1IjogMSwNCiJw
cmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVu
dG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9kaW1tMjMiOiB7DQoiZmF1bHQiOiAiRmFs
c2UiLA0KImZydV90eXBlIjogIkRJTU0iLA0KImlzX2ZydSI6IDEsDQoicHJlc2VudCI6ICJGYWxz
ZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2No
YXNzaXMvbW90aGVyYm9hcmQvZGltbTI0Ijogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlw
ZSI6ICJESU1NIiwNCiJpc19mcnUiOiAxLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24i
OiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJv
YXJkL2RpbW0yNSI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiRElNTSIsDQoi
aXNfZnJ1IjogMSwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29y
Zy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9kaW1tMjYiOiB7
DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIkRJTU0iLA0KImlzX2ZydSI6IDEsDQoi
cHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZl
bnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvZGltbTI3Ijogew0KImZhdWx0IjogIkZh
bHNlIiwNCiJmcnVfdHlwZSI6ICJESU1NIiwNCiJpc19mcnUiOiAxLA0KInByZXNlbnQiOiAiRmFs
c2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9j
aGFzc2lzL21vdGhlcmJvYXJkL2RpbW0yOCI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5
cGUiOiAiRElNTSIsDQoiaXNfZnJ1IjogMSwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9u
IjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJi
b2FyZC9kaW1tMjkiOiB7DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIkRJTU0iLA0K
ImlzX2ZydSI6IDEsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9v
cmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvZGltbTMiOiB7
DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIkRJTU0iLA0KImlzX2ZydSI6IDEsDQoi
cHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZl
bnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvZGltbTMvZXZlbnQiOiB7DQoiZW5kcG9p
bnRzIjogWw0KIi9vcmcvb3BlbmJtYy9yZWNvcmRzL2V2ZW50cy8xMSINCl0NCn0sDQoiL29yZy9v
cGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9kaW1tMzAiOiB7DQoi
ZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIkRJTU0iLA0KImlzX2ZydSI6IDEsDQoicHJl
c2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRv
cnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvZGltbTMxIjogew0KImZhdWx0IjogIkZhbHNl
IiwNCiJmcnVfdHlwZSI6ICJESU1NIiwNCiJpc19mcnUiOiAxLA0KInByZXNlbnQiOiAiRmFsc2Ui
LA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFz
c2lzL21vdGhlcmJvYXJkL2RpbW00Ijogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6
ICJESU1NIiwNCiJpc19mcnUiOiAxLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAi
Ig0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJk
L2RpbW01Ijogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJESU1NIiwNCiJpc19m
cnUiOiAxLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29w
ZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL2RpbW02Ijogew0KImZh
dWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJESU1NIiwNCiJpc19mcnUiOiAxLA0KInByZXNl
bnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5
L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL2RpbW03Ijogew0KImZhdWx0IjogIkZhbHNlIiwN
CiJmcnVfdHlwZSI6ICJESU1NIiwNCiJpc19mcnUiOiAxLA0KInByZXNlbnQiOiAiRmFsc2UiLA0K
InZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lz
L21vdGhlcmJvYXJkL2RpbW04Ijogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJE
SU1NIiwNCiJpc19mcnUiOiAxLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0K
fSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL2Rp
bW05Ijogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJESU1NIiwNCiJpc19mcnUi
OiAxLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5i
bWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL21lbWJ1ZjAiOiB7DQoiZmF1
bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIk1FTU9SWV9CVUZGRVIiLA0KImlzX2ZydSI6IDAs
DQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9p
bnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvbWVtYnVmMSI6IHsNCiJmYXVsdCI6
ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiTUVNT1JZX0JVRkZFUiIsDQoiaXNfZnJ1IjogMCwNCiJw
cmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVu
dG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9tZW1idWYyIjogew0KImZhdWx0IjogIkZh
bHNlIiwNCiJmcnVfdHlwZSI6ICJNRU1PUllfQlVGRkVSIiwNCiJpc19mcnUiOiAwLA0KInByZXNl
bnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5
L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL21lbWJ1ZjMiOiB7DQoiZmF1bHQiOiAiRmFsc2Ui
LA0KImZydV90eXBlIjogIk1FTU9SWV9CVUZGRVIiLA0KImlzX2ZydSI6IDAsDQoicHJlc2VudCI6
ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lz
dGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvbWVtYnVmNCI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoi
ZnJ1X3R5cGUiOiAiTUVNT1JZX0JVRkZFUiIsDQoiaXNfZnJ1IjogMCwNCiJwcmVzZW50IjogIkZh
bHNlIiwNCiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0v
Y2hhc3Npcy9tb3RoZXJib2FyZC9tZW1idWY1Ijogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVf
dHlwZSI6ICJNRU1PUllfQlVGRkVSIiwNCiJpc19mcnUiOiAwLA0KInByZXNlbnQiOiAiRmFsc2Ui
LA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFz
c2lzL21vdGhlcmJvYXJkL21lbWJ1ZjYiOiB7DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBl
IjogIk1FTU9SWV9CVUZGRVIiLA0KImlzX2ZydSI6IDAsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoi
dmVyc2lvbiI6ICIiDQp9LA0KIi9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMv
bW90aGVyYm9hcmQvbWVtYnVmNyI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAi
TUVNT1JZX0JVRkZFUiIsDQoiaXNfZnJ1IjogMCwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJz
aW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3Ro
ZXJib2FyZC9wY2llY2xvY2siOiB7DQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIk1B
SU5fUExBTkFSIiwNCiJpc19mcnUiOiAwLA0KInByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24i
OiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJv
YXJkL3JlZmNsb2NrIjogew0KImZhdWx0IjogIkZhbHNlIiwNCiJmcnVfdHlwZSI6ICJNQUlOX1BM
QU5BUiIsDQoiaXNfZnJ1IjogMCwNCiJwcmVzZW50IjogIkZhbHNlIiwNCiJ2ZXJzaW9uIjogIiIN
Cn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC90
b2RjbG9jayI6IHsNCiJmYXVsdCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiTUFJTl9QTEFOQVIi
LA0KImlzX2ZydSI6IDAsDQoicHJlc2VudCI6ICJGYWxzZSIsDQoidmVyc2lvbiI6ICIiDQp9LA0K
Ii9vcmcvb3BlbmJtYy9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvc2FzX2V4cGFuZGVyIjogew0K
IkN1c3RvbSBGaWVsZCAxIjogIkFCQ0QiLA0KIkN1c3RvbSBGaWVsZCAyIjogIiIsDQoiQ3VzdG9t
IEZpZWxkIDMiOiAiIiwNCiJDdXN0b20gRmllbGQgNCI6ICIiLA0KIkN1c3RvbSBGaWVsZCA1Ijog
IiIsDQoiQ3VzdG9tIEZpZWxkIDYiOiAiIiwNCiJDdXN0b20gRmllbGQgNyI6ICIiLA0KIkN1c3Rv
bSBGaWVsZCA4IjogIiIsDQoiRlJVIEZpbGUgSUQiOiAiIiwNCiJNYW51ZmFjdHVyZXIiOiAiRk9Y
Q09OTiIsDQoiTmFtZSI6ICJTQVMgRXhwYW5kZXIiLA0KIlBhcnQgTnVtYmVyIjogIlBOMTIzNDUi
LA0KIlNlcmlhbCBOdW1iZXIiOiAiU04xMjM0NSIsDQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90
eXBlIjogIkRBVUdIVEVSX0NBUkQiLA0KImlzX2ZydSI6IDEsDQoicHJlc2VudCI6ICJUcnVlIiwN
CiJ2ZXJzaW9uIjogIiINCn0sDQoiL29yZy9vcGVuYm1jL2ludmVudG9yeS9zeXN0ZW0vbWlzYyI6
IHsNCiJDdXN0b20gRmllbGQgMSI6ICJSYWNrc3BhY2UgVVMsIEluYy4iLA0KIkN1c3RvbSBGaWVs
ZCAyIjogIiIsDQoiQ3VzdG9tIEZpZWxkIDMiOiAiIiwNCiJDdXN0b20gRmllbGQgNCI6ICIiLA0K
IkN1c3RvbSBGaWVsZCA1IjogIiIsDQoiQ3VzdG9tIEZpZWxkIDYiOiAiIiwNCiJDdXN0b20gRmll
bGQgNyI6ICIiLA0KIkN1c3RvbSBGaWVsZCA4IjogIiIsDQoiRlJVIEZpbGUgSUQiOiAiRlJVIFZl
ciAwLjAxIiwNCiJNYW51ZmFjdHVyZXIiOiAiRk9YQ09OTiIsDQoiTmFtZSI6ICJCQVJSRUxFWUUg
TUIiLA0KIlBhcnQgTnVtYmVyIjogIjAyMDMwNVIwMC02MDAtRyIsDQoiU2VyaWFsIE51bWJlciI6
ICIwMjAzMDVSMDBYMTU3MTAwMSIsDQoiZmF1bHQiOiAiRmFsc2UiLA0KImZydV90eXBlIjogIlNZ
U1RFTSIsDQoiaXNfZnJ1IjogMCwNCiJwcmVzZW50IjogIlRydWUiLA0KInZlcnNpb24iOiAiIg0K
fSwNCiIvb3JnL29wZW5ibWMvaW52ZW50b3J5L3N5c3RlbS9zeXN0ZW1ldmVudCI6IHsNCiJmYXVs
dCI6ICJGYWxzZSIsDQoiZnJ1X3R5cGUiOiAiU1lTVEVNX0VWRU5UIiwNCiJpc19mcnUiOiAwLA0K
InByZXNlbnQiOiAiRmFsc2UiLA0KInZlcnNpb24iOiAiIg0KfSwNCiIvb3JnL29wZW5ibWMvaW52
ZW50b3J5L3N5c3RlbS9zeXN0ZW1ldmVudC9ldmVudCI6IHsNCiJlbmRwb2ludHMiOiBbDQoiL29y
Zy9vcGVuYm1jL3JlY29yZHMvZXZlbnRzLzEwIg0KXQ0KfQ0KfSwNCiJtZXNzYWdlIjogIjIwMCBP
SyIsDQoic3RhdHVzIjogIm9rIg0KfQ0KDQoNCuKAlA0KWW91IGFyZSByZWNlaXZpbmcgdGhpcyBi
ZWNhdXNlIHlvdSB3ZXJlIGFzc2lnbmVkLg0KUmVwbHkgdG8gdGhpcyBlbWFpbCBkaXJlY3RseSwg
dmlldyBpdCBvbiBHaXRIdWIsIG9yIG11dGUgdGhlIHRocmVhZC4NCg0KDQo=

--1__=EABBF570DFB181558f9e8a93df938690918cEABBF570DFB18155
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=UTF-8
Content-Disposition: inline

<html><body><p>Sivas,<br><br>Present bit for CORE and DIMM are to be update=
d by HB. <br><br>Thanks<br><br>--------------------------------------------=
-----------------------------------------<br>Thanks and Regards,<br>Vishwan=
ath.<br>Advisory Software Engineer,<br>Power Firmware Development, <br>Syst=
ems &amp;Technology Lab,<br>MG2-6F-255 , Manyata Embassy Business Park, <br=
>Bangalore , KA , 560045<br>Ph: +91-80-46678255<br>E-mail: vishwanath@in.ib=
m.com<br>------------------------------------------------------------------=
----------------<br><br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=
=3DEABBF570DFB181558f9e8a93df938690918cEAB@" border=3D"0" alt=3D"Inactive h=
ide details for sivassrr ---07/01/2016 09:35:39 AM---with the latest level =
(Jun 30 build ) - Here is the output. Siva"><font color=3D"#424282">sivassr=
r ---07/01/2016 09:35:39 AM---with the latest level (Jun 30 build ) - Here =
is the output. Sivass-MBP:~ sivas$ curl -c cjar -b cjar</font><br><br><font=
 size=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">sivassrr=
 &lt;notifications@github.com&gt;</font><br><font size=3D"2" color=3D"#5F5F=
5F">To:        </font><font size=3D"2">openbmc/openbmc &lt;openbmc@noreply.=
github.com&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Cc:        </fo=
nt><font size=3D"2">Vishwanatha Subbanna/India/IBM@IBMIN, Assign &lt;assign=
@noreply.github.com&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Date: =
       </font><font size=3D"2">07/01/2016 09:35 AM</font><br><font size=3D"=
2" color=3D"#5F5F5F">Subject:        </font><font size=3D"2">Re: [openbmc/o=
penbmc] CORE and DIMM Present value as False (#428)</font><br><hr width=3D"=
100%" size=3D"2" align=3D"left" noshade style=3D"color:#8091A5; "><br><br><=
br><font size=3D"4">with the latest level (Jun 30 build ) - Here is the out=
put.<br>Sivass-MBP:~ sivas$ curl -c cjar -b cjar -k </font><a href=3D"https=
://9.3.23.32/org/openbmc/inventory/enumerate"><u><font size=3D"4" color=3D"=
#0000FF">https://9.3.23.32/org/openbmc/inventory/enumerate</font></u></a><f=
ont size=3D"4"><br>{<br>&quot;data&quot;: {<br>&quot;/org/openbmc/inventory=
/system&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Fty=
pe&quot;: &quot;SYSTEM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&=
quot;: &quot;True&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quo=
t;/org/openbmc/inventory/system/bios&quot;: {<br>&quot;fault&quot;: &quot;F=
alse&quot;,<br>&quot;fru=5Ftype&quot;: &quot;SYSTEM&quot;,<br>&quot;is=5Ffr=
u&quot;: 1,<br>&quot;present&quot;: &quot;True&quot;,<br>&quot;version&quot=
;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis&quot;:=
 {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quo=
t;SYSTEM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;T=
rue&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc=
/inventory/system/chassis/fan0&quot;: {<br>&quot;fault&quot;: &quot;False&q=
uot;,<br>&quot;fru=5Ftype&quot;: &quot;FAN&quot;,<br>&quot;is=5Ffru&quot;: =
1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot=
;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/fan1&quot;: {<=
br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;F=
AN&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&q=
uot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inve=
ntory/system/chassis/fan2&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,=
<br>&quot;fru=5Ftype&quot;: &quot;FAN&quot;,<br>&quot;is=5Ffru&quot;: 1,<br=
>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quo=
t;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/fan3&quot;: {<br>&q=
uot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;FAN&qu=
ot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,=
<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory=
/system/chassis/fan4&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&=
quot;fru=5Ftype&quot;: &quot;FAN&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quo=
t;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br=
>},<br>&quot;/org/openbmc/inventory/system/chassis/fan5&quot;: {<br>&quot;f=
ault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;FAN&quot;,<=
br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&=
quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/syst=
em/chassis/hdd=5Fbackplane&quot;: {<br>&quot;fault&quot;: &quot;True&quot;,=
<br>&quot;fru=5Ftype&quot;: &quot;DAUGHTER=5FCARD&quot;,<br>&quot;is=5Ffru&=
quot;: 1,<br>&quot;present&quot;: &quot;True&quot;,<br>&quot;version&quot;:=
 &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/io=5Fboa=
rd&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&qu=
ot;: &quot;DAUGHTER=5FCARD&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;pres=
ent&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br=
>&quot;/org/openbmc/inventory/system/chassis/io=5Fboard/pcie=5Fmezz0&quot;:=
 {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quo=
t;PCIE=5FCARD&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &q=
uot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/o=
penbmc/inventory/system/chassis/io=5Fboard/pcie=5Fmezz1&quot;: {<br>&quot;f=
ault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;PCIE=5FCARD=
&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quo=
t;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/invent=
ory/system/chassis/io=5Fboard/pcie=5Fslot0&quot;: {<br>&quot;fault&quot;: &=
quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;PCIE=5FCARD&quot;,<br>&q=
uot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;=
version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/ch=
assis/io=5Fboard/pcie=5Fslot0=5Friser&quot;: {<br>&quot;fault&quot;: &quot;=
False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;PCIE=5FRISER&quot;,<br>&quot;=
is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;vers=
ion&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassi=
s/io=5Fboard/pcie=5Fslot1&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,=
<br>&quot;fru=5Ftype&quot;: &quot;PCIE=5FCARD&quot;,<br>&quot;is=5Ffru&quot=
;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &q=
uot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/io=5Fboard/=
pcie=5Fslot1=5Friser&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&=
quot;fru=5Ftype&quot;: &quot;PCIE=5FRISER&quot;,<br>&quot;is=5Ffru&quot;: 1=
,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;=
&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/io=5Fboard/pcie=
=5Fslot2&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ft=
ype&quot;: &quot;PCIE=5FCARD&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;pr=
esent&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<=
br>&quot;/org/openbmc/inventory/system/chassis/io=5Fboard/pcie=5Fslot2=5Fri=
ser&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&q=
uot;: &quot;PCIE=5FRISER&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;presen=
t&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&=
quot;/org/openbmc/inventory/system/chassis/motherboard&quot;: {<br>&quot;Cu=
stom Field 1&quot;: &quot;&quot;,<br>&quot;Custom Field 2&quot;: &quot;Rack=
space US, Inc.&quot;,<br>&quot;Custom Field 3&quot;: &quot;&quot;,<br>&quot=
;Custom Field 4&quot;: &quot;&quot;,<br>&quot;Custom Field 5&quot;: &quot;&=
quot;,<br>&quot;Custom Field 6&quot;: &quot;&quot;,<br>&quot;Custom Field 7=
&quot;: &quot;&quot;,<br>&quot;Custom Field 8&quot;: &quot;&quot;,<br>&quot=
;Part Number&quot;: &quot;020305R00-600-G&quot;,<br>&quot;Serial Number&quo=
t;: &quot;020305R00X1571001&quot;,<br>&quot;Type&quot;: 23,<br>&quot;fault&=
quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;MAIN=5FPLANAR&qu=
ot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;True&quot;,<=
br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/=
system/chassis/motherboard/apss&quot;: {<br>&quot;fault&quot;: &quot;False&=
quot;,<br>&quot;fru=5Ftype&quot;: &quot;MAIN=5FPLANAR&quot;,<br>&quot;is=5F=
fru&quot;: 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&q=
uot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/mot=
herboard/bmc&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=
=5Ftype&quot;: &quot;BMC&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;manufa=
cturer&quot;: &quot;ASPEED&quot;,<br>&quot;present&quot;: &quot;False&quot;=
,<br>&quot;version&quot;: &quot;\&quot;v1.0-48-g8d43aee-dirty\&quot;&quot;<=
br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/cpu0&quot;=
: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &qu=
ot;CPU&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;Fal=
se&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/=
inventory/system/chassis/motherboard/cpu0/core0&quot;: {<br>&quot;fault&quo=
t;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;CORE&quot;,<br>&quo=
t;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;ve=
rsion&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chas=
sis/motherboard/cpu0/core1&quot;: {<br>&quot;fault&quot;: &quot;False&quot;=
,<br>&quot;fru=5Ftype&quot;: &quot;CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<=
br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&q=
uot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/cpu0/=
core10&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftyp=
e&quot;: &quot;CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quo=
t;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;=
/org/openbmc/inventory/system/chassis/motherboard/cpu0/core11&quot;: {<br>&=
quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;CORE&=
quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;False&quot=
;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/invento=
ry/system/chassis/motherboard/cpu0/core2&quot;: {<br>&quot;fault&quot;: &qu=
ot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;CORE&quot;,<br>&quot;is=5F=
fru&quot;: 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&q=
uot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/mot=
herboard/cpu0/core3&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&q=
uot;fru=5Ftype&quot;: &quot;CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quo=
t;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br=
>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/cpu0/core4&q=
uot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;:=
 &quot;CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quo=
t;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/ope=
nbmc/inventory/system/chassis/motherboard/cpu0/core5&quot;: {<br>&quot;faul=
t&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;CORE&quot;,<br=
>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&qu=
ot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system=
/chassis/motherboard/cpu0/core6&quot;: {<br>&quot;fault&quot;: &quot;False&=
quot;,<br>&quot;fru=5Ftype&quot;: &quot;CORE&quot;,<br>&quot;is=5Ffru&quot;=
: 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &qu=
ot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/=
cpu0/core7&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=
=5Ftype&quot;: &quot;CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;prese=
nt&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>=
&quot;/org/openbmc/inventory/system/chassis/motherboard/cpu0/core8&quot;: {=
<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;=
CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;False=
&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/in=
ventory/system/chassis/motherboard/cpu0/core9&quot;: {<br>&quot;fault&quot;=
: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;CORE&quot;,<br>&quot;=
is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;vers=
ion&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassi=
s/motherboard/cpu1&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&qu=
ot;fru=5Ftype&quot;: &quot;CPU&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;=
present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>}=
,<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/cpu1/core0&quo=
t;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &=
quot;CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;=
False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openb=
mc/inventory/system/chassis/motherboard/cpu1/core1&quot;: {<br>&quot;fault&=
quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;CORE&quot;,<br>&=
quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot=
;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/c=
hassis/motherboard/cpu1/core10&quot;: {<br>&quot;fault&quot;: &quot;False&q=
uot;,<br>&quot;fru=5Ftype&quot;: &quot;CORE&quot;,<br>&quot;is=5Ffru&quot;:=
 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quo=
t;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/c=
pu1/core11&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=
=5Ftype&quot;: &quot;CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;prese=
nt&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>=
&quot;/org/openbmc/inventory/system/chassis/motherboard/cpu1/core2&quot;: {=
<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;=
CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;False=
&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/in=
ventory/system/chassis/motherboard/cpu1/core3&quot;: {<br>&quot;fault&quot;=
: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;CORE&quot;,<br>&quot;=
is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;vers=
ion&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassi=
s/motherboard/cpu1/core4&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<=
br>&quot;fru=5Ftype&quot;: &quot;CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<br=
>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quo=
t;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/cpu1/co=
re5&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&q=
uot;: &quot;CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;:=
 &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/or=
g/openbmc/inventory/system/chassis/motherboard/cpu1/core6&quot;: {<br>&quot=
;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;CORE&quot=
;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;False&quot;,<b=
r>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/s=
ystem/chassis/motherboard/cpu1/core7&quot;: {<br>&quot;fault&quot;: &quot;F=
alse&quot;,<br>&quot;fru=5Ftype&quot;: &quot;CORE&quot;,<br>&quot;is=5Ffru&=
quot;: 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;=
: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherb=
oard/cpu1/core8&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;=
fru=5Ftype&quot;: &quot;CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;pr=
esent&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<=
br>&quot;/org/openbmc/inventory/system/chassis/motherboard/cpu1/core9&quot;=
: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &qu=
ot;CORE&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;Fa=
lse&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc=
/inventory/system/chassis/motherboard/dimm0&quot;: {<br>&quot;fault&quot;: =
&quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=
=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;versio=
n&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/=
motherboard/dimm1&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quo=
t;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;=
present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>}=
,<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/dimm10&quot;: =
{<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot=
;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;Fals=
e&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/i=
nventory/system/chassis/motherboard/dimm11&quot;: {<br>&quot;fault&quot;: &=
quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=
=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;versio=
n&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/=
motherboard/dimm12&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&qu=
ot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot=
;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>=
},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/dimm13&quot;:=
 {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quo=
t;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;Fal=
se&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/=
inventory/system/chassis/motherboard/dimm14&quot;: {<br>&quot;fault&quot;: =
&quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=
=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;versio=
n&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/=
motherboard/dimm15&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&qu=
ot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot=
;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>=
},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/dimm16&quot;:=
 {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quo=
t;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;Fal=
se&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/=
inventory/system/chassis/motherboard/dimm17&quot;: {<br>&quot;fault&quot;: =
&quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=
=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;versio=
n&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/=
motherboard/dimm18&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&qu=
ot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot=
;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>=
},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/dimm19&quot;:=
 {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quo=
t;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;Fal=
se&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/=
inventory/system/chassis/motherboard/dimm2&quot;: {<br>&quot;fault&quot;: &=
quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=
=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;versio=
n&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/=
motherboard/dimm2/event&quot;: {<br>&quot;endpoints&quot;: [<br>&quot;/org/=
openbmc/records/events/11&quot;<br>]<br>},<br>&quot;/org/openbmc/inventory/=
system/chassis/motherboard/dimm20&quot;: {<br>&quot;fault&quot;: &quot;Fals=
e&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quo=
t;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &=
quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboar=
d/dimm21&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ft=
ype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&q=
uot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quo=
t;/org/openbmc/inventory/system/chassis/motherboard/dimm22&quot;: {<br>&quo=
t;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quo=
t;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<=
br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/=
system/chassis/motherboard/dimm23&quot;: {<br>&quot;fault&quot;: &quot;Fals=
e&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quo=
t;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &=
quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboar=
d/dimm24&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ft=
ype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&q=
uot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quo=
t;/org/openbmc/inventory/system/chassis/motherboard/dimm25&quot;: {<br>&quo=
t;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quo=
t;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<=
br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/=
system/chassis/motherboard/dimm26&quot;: {<br>&quot;fault&quot;: &quot;Fals=
e&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quo=
t;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &=
quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboar=
d/dimm27&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ft=
ype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&q=
uot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quo=
t;/org/openbmc/inventory/system/chassis/motherboard/dimm28&quot;: {<br>&quo=
t;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quo=
t;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<=
br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/=
system/chassis/motherboard/dimm29&quot;: {<br>&quot;fault&quot;: &quot;Fals=
e&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quo=
t;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &=
quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboar=
d/dimm3&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Fty=
pe&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&qu=
ot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot=
;/org/openbmc/inventory/system/chassis/motherboard/dimm3/event&quot;: {<br>=
&quot;endpoints&quot;: [<br>&quot;/org/openbmc/records/events/11&quot;<br>]=
<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/dimm30&qu=
ot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: =
&quot;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot=
;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/open=
bmc/inventory/system/chassis/motherboard/dimm31&quot;: {<br>&quot;fault&quo=
t;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quo=
t;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;ve=
rsion&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chas=
sis/motherboard/dimm4&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>=
&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&q=
uot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<=
br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/dimm5&quot=
;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &q=
uot;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;F=
alse&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbm=
c/inventory/system/chassis/motherboard/dimm6&quot;: {<br>&quot;fault&quot;:=
 &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;i=
s=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;versi=
on&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis=
/motherboard/dimm7&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&qu=
ot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot=
;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>=
},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/dimm8&quot;: =
{<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot=
;DIMM&quot;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;Fals=
e&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/i=
nventory/system/chassis/motherboard/dimm9&quot;: {<br>&quot;fault&quot;: &q=
uot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DIMM&quot;,<br>&quot;is=
=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;versio=
n&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/=
motherboard/membuf0&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&q=
uot;fru=5Ftype&quot;: &quot;MEMORY=5FBUFFER&quot;,<br>&quot;is=5Ffru&quot;:=
 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quo=
t;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/m=
embuf1&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftyp=
e&quot;: &quot;MEMORY=5FBUFFER&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;=
present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>}=
,</font><br><font size=3D"4">&quot;/org/openbmc/inventory/system/chassis/mo=
therboard/membuf2&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quo=
t;fru=5Ftype&quot;: &quot;MEMORY=5FBUFFER&quot;,<br>&quot;is=5Ffru&quot;: 0=
,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;=
&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/mem=
buf3&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&=
quot;: &quot;MEMORY=5FBUFFER&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;pr=
esent&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<=
br>&quot;/org/openbmc/inventory/system/chassis/motherboard/membuf4&quot;: {=
<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;=
MEMORY=5FBUFFER&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: =
&quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org=
/openbmc/inventory/system/chassis/motherboard/membuf5&quot;: {<br>&quot;fau=
lt&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;MEMORY=5FBUFF=
ER&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;False&q=
uot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inve=
ntory/system/chassis/motherboard/membuf6&quot;: {<br>&quot;fault&quot;: &qu=
ot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;MEMORY=5FBUFFER&quot;,<br>=
&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&quo=
t;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/=
chassis/motherboard/membuf7&quot;: {<br>&quot;fault&quot;: &quot;False&quot=
;,<br>&quot;fru=5Ftype&quot;: &quot;MEMORY=5FBUFFER&quot;,<br>&quot;is=5Ffr=
u&quot;: 0,<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quo=
t;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/mothe=
rboard/pcieclock&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot=
;fru=5Ftype&quot;: &quot;MAIN=5FPLANAR&quot;,<br>&quot;is=5Ffru&quot;: 0,<b=
r>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&qu=
ot;<br>},<br>&quot;/org/openbmc/inventory/system/chassis/motherboard/refclo=
ck&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&qu=
ot;: &quot;MAIN=5FPLANAR&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;presen=
t&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&=
quot;/org/openbmc/inventory/system/chassis/motherboard/todclock&quot;: {<br=
>&quot;fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;MAI=
N=5FPLANAR&quot;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot=
;False&quot;,<br>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/open=
bmc/inventory/system/chassis/sas=5Fexpander&quot;: {<br>&quot;Custom Field =
1&quot;: &quot;ABCD&quot;,<br>&quot;Custom Field 2&quot;: &quot;&quot;,<br>=
&quot;Custom Field 3&quot;: &quot;&quot;,<br>&quot;Custom Field 4&quot;: &q=
uot;&quot;,<br>&quot;Custom Field 5&quot;: &quot;&quot;,<br>&quot;Custom Fi=
eld 6&quot;: &quot;&quot;,<br>&quot;Custom Field 7&quot;: &quot;&quot;,<br>=
&quot;Custom Field 8&quot;: &quot;&quot;,<br>&quot;FRU File ID&quot;: &quot=
;&quot;,<br>&quot;Manufacturer&quot;: &quot;FOXCONN&quot;,<br>&quot;Name&qu=
ot;: &quot;SAS Expander&quot;,<br>&quot;Part Number&quot;: &quot;PN12345&qu=
ot;,<br>&quot;Serial Number&quot;: &quot;SN12345&quot;,<br>&quot;fault&quot=
;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;DAUGHTER=5FCARD&quot=
;,<br>&quot;is=5Ffru&quot;: 1,<br>&quot;present&quot;: &quot;True&quot;,<br=
>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/sy=
stem/misc&quot;: {<br>&quot;Custom Field 1&quot;: &quot;Rackspace US, Inc.&=
quot;,<br>&quot;Custom Field 2&quot;: &quot;&quot;,<br>&quot;Custom Field 3=
&quot;: &quot;&quot;,<br>&quot;Custom Field 4&quot;: &quot;&quot;,<br>&quot=
;Custom Field 5&quot;: &quot;&quot;,<br>&quot;Custom Field 6&quot;: &quot;&=
quot;,<br>&quot;Custom Field 7&quot;: &quot;&quot;,<br>&quot;Custom Field 8=
&quot;: &quot;&quot;,<br>&quot;FRU File ID&quot;: &quot;FRU Ver 0.01&quot;,=
<br>&quot;Manufacturer&quot;: &quot;FOXCONN&quot;,<br>&quot;Name&quot;: &qu=
ot;BARRELEYE MB&quot;,<br>&quot;Part Number&quot;: &quot;020305R00-600-G&qu=
ot;,<br>&quot;Serial Number&quot;: &quot;020305R00X1571001&quot;,<br>&quot;=
fault&quot;: &quot;False&quot;,<br>&quot;fru=5Ftype&quot;: &quot;SYSTEM&quo=
t;,<br>&quot;is=5Ffru&quot;: 0,<br>&quot;present&quot;: &quot;True&quot;,<b=
r>&quot;version&quot;: &quot;&quot;<br>},<br>&quot;/org/openbmc/inventory/s=
ystem/systemevent&quot;: {<br>&quot;fault&quot;: &quot;False&quot;,<br>&quo=
t;fru=5Ftype&quot;: &quot;SYSTEM=5FEVENT&quot;,<br>&quot;is=5Ffru&quot;: 0,=
<br>&quot;present&quot;: &quot;False&quot;,<br>&quot;version&quot;: &quot;&=
quot;<br>},<br>&quot;/org/openbmc/inventory/system/systemevent/event&quot;:=
 {<br>&quot;endpoints&quot;: [<br>&quot;/org/openbmc/records/events/10&quot=
;<br>]<br>}<br>},<br>&quot;message&quot;: &quot;200 OK&quot;,<br>&quot;stat=
us&quot;: &quot;ok&quot;<br>}</font><p><font color=3D"#666666">=E2=80=94<br=
>You are receiving this because you were assigned.<br>Reply to this email d=
irectly, </font><a href=3D"https://github.com/openbmc/openbmc/issues/428#is=
suecomment-229849203"><u><font color=3D"#0000FF">view it on GitHub</font></=
u></a><font color=3D"#666666">, or </font><a href=3D"https://github.com/not=
ifications/unsubscribe/ANS1jR2mUn0HbT6P7VUH4zHbuVydIEpAks5qRJHxgaJpZM4JCF-j=
"><u><font color=3D"#0000FF">mute the thread</font></u></a><font color=3D"#=
666666">.</font><p><BR>
</body></html>

--1__=EABBF570DFB181558f9e8a93df938690918cEABBF570DFB18155--


--0__=EABBF570DFB181558f9e8a93df938690918cEABBF570DFB18155
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF570DFB181558f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF570DFB181558f9e8a93df938690918cEABBF570DFB18155--
