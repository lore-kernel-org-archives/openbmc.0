Return-Path: <gkeishin@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rw6H42pm1zDqXJ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 18:23:11 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u6L8EN95018428
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 04:23:09 -0400
Received: from e28smtp01.in.ibm.com (e28smtp01.in.ibm.com [125.16.236.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 24aj3x6vu6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 04:23:08 -0400
Received: from localhost
 by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Thu, 21 Jul 2016 13:53:04 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
 by e28smtp01.in.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 21 Jul 2016 13:52:57 +0530
X-IBM-Helo: d28dlp03.in.ibm.com
X-IBM-MailFrom: gkeishin@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay10.in.ibm.com (d28relay10.in.ibm.com [9.184.220.161])
 by d28dlp03.in.ibm.com (Postfix) with ESMTP id 5D3C71258073
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 13:55:51 +0530 (IST)
Received: from d50lp03.ny.us.ibm.com (d50lp03.extnet.ibm.com [146.89.104.211])
 by d28relay10.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6L8MmEP32768220
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 13:52:54 +0530
Received: from localhost
 by d50lp03.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Thu, 21 Jul 2016 04:22:48 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp03.ny.us.ibm.com (158.87.18.22) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 21 Jul 2016 04:22:46 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: gkeishin@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Thu, 21 Jul 2016 08:22:45 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 21 Jul 2016 08:22:42 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.45.236])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016072108224176-127103 ;
 Thu, 21 Jul 2016 08:22:41 +0000 
To: openbmc@lists.ozlabs.org
Subject: Open BMC FFDC ( First Failure Data Capture) on automated Test failure
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Thu, 21 Jul 2016 13:52:42 +0530
MIME-Version: 1.0
X-KeepSent: EBCFE5D9:DB330E85-00257FF7:002CA488;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP5 SHF190 February 24, 2016
X-LLNOutbound: False
X-Disclaimed: 53331
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 002DD99065257FF7_="
x-cbid: 16072108-4789-0000-0000-000002F77D72
X-IBM-ISS-SpamDetectors: Score=0.439231; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.439231; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005514; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000174; SDB=6.00733352; UDB=6.00343940; UTC=2016-07-21
 08:22:43
x-cbparentid: 16072108-9588-0000-0000-000004D4E2E3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFEBCFE5D9.DB330E85-ON00257FF7.002CA488-65257FF7.002E04D1@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-21_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607210094
X-Mailman-Approved-At: Thu, 21 Jul 2016 19:01:27 +1000
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
X-List-Received-Date: Thu, 21 Jul 2016 08:23:12 -0000


--=_alternative 002DD99065257FF7_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-2022-JP"

Proposal   :  Method to trigger data collection of state logs from=20
applications, BMC and other information on failure.
=20
Background :  Open BMC test is written in ROBOT framework which generates=20
XML/HTML logs but not sufficient for debugging failures in general.

             - Robot Test framework HTML/XML logs gives good info but=20
generic
             - FFDC supplements with more Open BMC state logs for analysis
             - Asserts Test failure from Dev and Test perspective by
                   -- capturing generic logs=20
                   -- providing custom user define/preference data
                   -- point of failure data

Layout     : Capture data with a default name openbmc=5Fffdc=5Freport.txt=20
under current execution directory as logs/testSuite/testcaseName/ on=20
failure.

                        $ tree logs
                        logs
                        ??? TestSample
                                ??? VerifyConnection
                                        ??? openbmc=5Fffdc=5Freport.txt

                        2 directories, 1 file


Method     : Robot framework provides granular Test cases Setup and=20
Teardown capability

                         Framework methods :
=20
                         Calls the Test case failure FFDC collection=20
keyword as part of test case exit
                         [Teardown]   Log FFDC If Test Case Failed
=20
             Ability to use Resource/Library modules to support=20
functionality
             Provides in-built Automatic variables updated by framework=20
for checking if test case PASSED or FAILED and getting test suite and case =

name and paths

            Auto Variable : ${TEST=5FSTATUS}  ${TEST=5FNAME}    ${SUITE=5FN=
AME} =20
${EXECDIR}=20
=20
            # Return if the test case is a PASS
            Return From Keyword If  '${TEST=5FSTATUS}' !=3D 'FAIL'=20
            ... ELSE do the log collection

                        Connection methods:
=20
                        Current base support for SSH and SCP.
=20
Example   :

                        *** Settings ***
                        Resource        openbmc=5Fffdc.robot

                        *** Test Cases ***
                        Verify Connection
                        [Teardown]     Log FFDC If Test Case Failed
                        Should Be Equal   testing   OOPS

                                              Current code on Gerrit for=20
review : https://gerrit.openbmc-project.xyz/#/c/49/

output :=20
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
                        Test Sample
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
                        Verify Connection                    F=20
                        FFDC Collection Started         : 2016-07-21=20
01:41:14,252163
                        FFDC Collection Completed       : 2016-07-21=20
01:41:24,062357
                        Verify Connection                    | FAIL |
                        testing !=3D OOPS
=20
---------------------------------------------------------------------------=
---
                        Test Sample                    | FAIL |
                        1 critical test, 0 passed, 1 failed
                        1 test total, 0 passed, 1 failed
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

default ffdc list  construct :

#-----------------------------------------------------------------
#Dict Name {  Index string : { Key String :  Command string} }
#-----------------------------------------------------------------
FFDC=5FCMD =3D {
             'DRIVER INFO' :
                     {
                                'FW Level' : 'cat /etc/os-release',
                                'OS Details' : 'uname -a',
                                        'Build Info' : 'cat /etc/version',
                     },
             'BMC DATA' :
                     {
                              'System journal log' : 'journalctl=20
--no-pager',
                                       'Displays processor activity' :=20
'top -n 1 -b',
                     },
             'APPLICATION DATA' :
                     {
                          'BMC state' : '/usr/sbin/obmcutil  state',
                     },
           }


FFDC o/p :

$ cat  logs/TestSample/VerifyConnection/openbmc=5Fffdc=5Freport.txt

---------------------------------------------------------------------------=
-------------------
                OPEN BMC TEST FAILURE DATA CAPTURE
 ----------------------------------------------------------------------

TEST SUITE FILE         : Test Sample
TEST CASE NAME          : Verify Connection
FAILURE TIME STAMP      : 2016-07-21 01:41:14,275235

This document contains the following information:
* APPLICATION DATA
* DRIVER INFO
* BMC DATA
---------------------------------------------------------------------------=
--------------------------

                [ Detailed Logs Captured Section ]
---------------------------------------------------------------------------=
-----------------------------
APPLICATION DATA : BMC state    Executed : /usr/sbin/obmcutil  state
---------------------------------------------------------------------------=
-----------------------------
 =3D BMC=5FSTARTING
---------------------------------------------------------------------------=
-----------------------------

---------------------------------------------------------------------------=
-----------------------------
DRIVER INFO : Build Info        Executed : cat /etc/version
---------------------------------------------------------------------------=
-----------------------------
20160716161753
---------------------------------------------------------------------------=
-----------------------------

---------------------------------------------------------------------------=
-----------------------------
DRIVER INFO : OS Details        Executed : uname -a
---------------------------------------------------------------------------=
-----------------------------
Linux barreleye 4.6.4-openbmc-20160713-1 #1 Wed Jul 13 16:38:10 UTC 2016=20
armv5tejl GNU/Linux
---------------------------------------------------------------------------=
-----------------------------

---------------------------------------------------------------------------=
-----------------------------
DRIVER INFO : FW Level  Executed : cat /etc/os-release
---------------------------------------------------------------------------=
-----------------------------
ID=3D"openbmc-phosphor"
NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION=3D"0.1.0 (krogoth)"
VERSION=5FID=3D"v1.0-89-g5bc571e-dirty"
PRETTY=5FNAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distr=
o)=20
0.1.0 (krogoth)"
BUILD=5FID=3D"v1.0"
---------------------------------------------------------------------------=
-----------------------------

---------------------------------------------------------------------------=
-----------------------------
BMC DATA : System journal log   Executed : journalctl --no-pager
---------------------------------------------------------------------------=
-----------------------------
-- Logs begin at Mon 2016-07-11 22:01:17 UTC, end at Tue 2016-07-12=20
10:45:00 UTC. --
Jul 11 22:01:17 barreleye systemd-journald[395]: Runtime journal=20
(/run/log/journal/) is 3.1M, max 25.1M, 22.0M free.
Jul 11 22:01:17 barreleye kernel: Booting Linux on physical CPU 0x0
Jul 11 22:01:17 barreleye kernel: Linux version 4.6.4-openbmc-20160713-1=20
(jenkins@hudson) (gcc version 4.9.3 (GCC) ) #1 Wed Jul 13 16:38:10 UTC=20
2016
Jul 11 22:01:17 barreleye kernel: CPU: ARM926EJ-S [41069265] revision 5=20
(ARMv5TEJ), cr=3D0005317f
...
....

=20

FFDC Wish List :

For now we are delivering only for open BMC. The base infrastructure is=20
kept generic and simple to extend for Open Power test framework once the=20
porting is complete to ROBOT framework.

        * Wish list from Open BMC
                - journalctl --no-pager
                - bmc fw level (version)

        * Wish list from Open power
                - sel clear/list
                - sensor list
                - Inventory
                - SOL output
                - Driver Name
                - System ID (MTMS)
                - System Type
                - esel support (parsing)=20



Thanks and Regards,
George Keishing
IBM Systems &Technology Lab, Firmware Development,
=1B$B!H=1B(BThere isn't enough time in a day to be lazy!!! .=1B$B!I=1B(B



--=_alternative 002DD99065257FF7_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="ISO-2022-JP"

<font size=3D2 face=3D"sans-serif">Proposal &nbsp; : &nbsp;Method to trigger
data collection of state logs from applications, BMC and other information
on failure.</font><br><font size=3D2 face=3D"sans-serif">&nbsp;</font><br><=
font size=3D2 face=3D"sans-serif">Background : &nbsp;Open BMC test is
written in ROBOT framework which generates XML/HTML logs but not sufficient
for debugging failures in general.</font><br><br><font size=3D2 face=3D"san=
s-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;- Robot Test framework HTML/XML logs gives good info but generic</fon=
t><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp;- FFDC supplements with more Open BMC state logs for analysis</font><=
br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp;- Asserts Test failure from Dev and Test perspective by</font><br><fo=
nt size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;-- capturing generic logs </font><br><font size=
=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;-- providing custom user define/preference data<=
/font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;-- point of failure data</font><br><br><font siz=
e=3D2 face=3D"sans-serif">Layout &nbsp; &nbsp; : Capture data
with a default name openbmc=5Fffdc=5Freport.txt under current execution dir=
ectory
as logs/testSuite/testcaseName/ on failure.</font><br><br><font size=3D2 fa=
ce=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $ tree
logs</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; logs</font><br><font size=
=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#9492;&#9472;&#9472; Test=
Sample</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &#9492;&#9472;&#9472; VerifyConnection</font><br><font=
 size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#9492;&#9472;&#9472; open=
bmc=5Fffdc=5Freport.txt</font><br><br><font size=3D2 face=3D"sans-serif">&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2 directories,
1 file</font><br><br><br><font size=3D2 face=3D"sans-serif">Method &nbsp; &=
nbsp; : Robot framework
provides granular Test cases Setup and Teardown capability</font><br><br><f=
ont size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Framework
methods :</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font><br><font siz=
e=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Calls
the Test case failure FFDC collection keyword as part of test case exit</fo=
nt><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;[Teardown]
&nbsp; Log FFDC If Test Case Failed</font><br><font size=3D2 face=3D"sans-s=
erif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font><br><font siz=
e=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;Ability to use Resource/Library modules to support functionality</fon=
t><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp;Provides in-built Automatic variables updated by framework for checki=
ng
if test case PASSED or FAILED and getting test suite and case name and
paths</font><br><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;
Auto Variable : ${TEST=5FSTATUS} &nbsp;${TEST=5FNAME} &nbsp; &nbsp;${SUITE=
=5FNAME}
&nbsp; ${EXECDIR} </font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </font><br><font size=3D2 =
face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# Return if the test case is a PASS</font><br><font size=3D2 face=3D"sans-s=
erif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
Return From Keyword If &nbsp;'${TEST=5FSTATUS}' !=3D 'FAIL' &nbsp; &nbsp; &=
nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;
... ELSE do the log collection</font><br><br><font size=3D2 face=3D"sans-se=
rif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Connection
methods:</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </font><br><font size=3D2 =
face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Current
base support for SSH and SCP.</font><br><font size=3D2 face=3D"sans-serif">=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </font><br><font size=3D2 =
face=3D"sans-serif">Example &nbsp; :</font><br><br><font size=3D2 face=3D"s=
ans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *** Settings
***</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Resource
&nbsp; &nbsp; &nbsp; &nbsp;openbmc=5Fffdc.robot</font><br><br><font size=3D=
2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *** Test
Cases ***</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Verify
Connection</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [Teardown]
&nbsp; &nbsp; Log FFDC If Test Case Failed</font><br><font size=3D2 face=3D=
"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Should
Be Equal &nbsp; testing &nbsp; OOPS</font><br><br><font size=3D2 face=3D"sa=
ns-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Current code on Gerrit for review
: </font><a href=3D"https://gerrit.openbmc-project.xyz/#/c/49/"><font size=
=3D2 color=3Dblue face=3D"sans-serif">https://gerrit.openbmc-project.xyz/#/=
c/49/</font></a><br><br><font size=3D2 face=3D"sans-serif">output : &nbsp; =
&nbsp;</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</font><br><fon=
t size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Test Sample</font><br><fon=
t size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</font><br><fon=
t size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Verify
Connection &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; F &nbsp; &nbsp; &nbsp; &nbsp;</fo=
nt><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FFDC Collection
Started &nbsp; &nbsp; &nbsp; &nbsp; : 2016-07-21 01:41:14,252163</font><br>=
<font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FFDC Collection
Completed &nbsp; &nbsp; &nbsp; : 2016-07-21 01:41:24,062357</font><br><font=
 size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Verify
Connection &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | FAIL |</font><br><font size=3D2=
 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; testing
!=3D OOPS</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --------------------------=
----------------------------------------------------</font><br><font size=
=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Test Sample
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | FAIL |</font><br><font s=
ize=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1 critical
test, 0 passed, 1 failed</font><br><font size=3D2 face=3D"sans-serif">&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1 test
total, 0 passed, 1 failed</font><br><font size=3D2 face=3D"sans-serif">&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</font><br><br>=
<font size=3D2 face=3D"sans-serif">default ffdc list &nbsp;construct :</fon=
t><br><br><font size=3D2 face=3D"sans-serif">#-----------------------------=
------------------------------------</font><br><font size=3D2 face=3D"sans-=
serif">#Dict Name { &nbsp;Index string : {
Key String : &nbsp;Command string} }</font><br><font size=3D2 face=3D"sans-=
serif">#-----------------------------------------------------------------</=
font><br><font size=3D2 face=3D"sans-serif">FFDC=5FCMD =3D {</font><br><fon=
t size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;'DRIVER INFO' :</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</font><br><font size=3D2 face=3D"sans-s=
erif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
'FW Level' : 'cat /etc/os-release',</font><br><font size=3D2 face=3D"sans-s=
erif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; 'OS Details' : 'uname -a',</font><br><font size=3D2 face=3D"sans-ser=
if">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; 'Build Info' : 'cat /etc/version',</font><br><font siz=
e=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},</font><br><font size=3D2 face=3D"sans-=
serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;'BMC DATA' :</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</font><br><font size=3D2 face=3D"sans-s=
erif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; 'System journal log' : 'journalctl --no-pager',</font><br><fo=
nt size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;'Displays processor activity' : 'top -n 1 -b',</font><b=
r><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},</font><br><font size=3D2 face=3D"sans-=
serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;'APPLICATION DATA' :</font><br><font size=3D2 face=3D"sans-serif">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</font><br><font size=3D2 face=3D"sans-s=
erif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
'BMC state' : '/usr/sbin/obmcutil &nbsp;state',</font><br><font size=3D2 fa=
ce=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},</font><br><font size=3D2 face=3D"sans-=
serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</font><br><br><br><font s=
ize=3D2 face=3D"sans-serif">FFDC o/p :</font><br><br><font size=3D2 face=3D=
"sans-serif">$ cat &nbsp;logs/TestSample/VerifyConnection/openbmc=5Fffdc=5F=
report.txt</font><br><br><font size=3D2 face=3D"sans-serif">---------------=
---------------------------------------------------------------------------=
----</font><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
&nbsp; &nbsp; OPEN BMC TEST FAILURE DATA CAPTURE</font><br><font size=3D2 f=
ace=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; -------------------------------------------------------------=
---------</font><br><br><font size=3D2 face=3D"sans-serif">TEST SUITE FILE =
&nbsp; &nbsp; &nbsp;
&nbsp; : Test Sample</font><br><font size=3D2 face=3D"sans-serif">TEST CASE=
 NAME &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;: Verify Connection</font><br><font size=3D2 face=3D"sans-seri=
f">FAILURE TIME STAMP &nbsp; &nbsp; &nbsp;:
2016-07-21 01:41:14,275235</font><br><br><font size=3D2 face=3D"sans-serif"=
>This document contains the following
information:</font><br><font size=3D2 face=3D"sans-serif">* APPLICATION DAT=
A</font><br><font size=3D2 face=3D"sans-serif">* DRIVER INFO</font><br><fon=
t size=3D2 face=3D"sans-serif">* BMC DATA</font><br><font size=3D2 face=3D"=
sans-serif">---------------------------------------------------------------=
--------------------------------------</font><br><br><font size=3D2 face=3D=
"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; [ Detailed Logs Captured Section ]</font><br><font size=3D2 f=
ace=3D"sans-serif">--------------------------------------------------------=
------------------------------------------------</font><br><font size=3D2 f=
ace=3D"sans-serif">APPLICATION DATA : BMC state &nbsp;
&nbsp;Executed : /usr/sbin/obmcutil &nbsp;state</font><br><font size=3D2 fa=
ce=3D"sans-serif">---------------------------------------------------------=
-----------------------------------------------</font><br><font size=3D2 fa=
ce=3D"sans-serif">&nbsp;=3D BMC=5FSTARTING</font><br><font size=3D2 face=3D=
"sans-serif">--------------------------------------------------------------=
------------------------------------------</font><br><br><font size=3D2 fac=
e=3D"sans-serif">----------------------------------------------------------=
----------------------------------------------</font><br><font size=3D2 fac=
e=3D"sans-serif">DRIVER INFO : Build Info &nbsp; &nbsp;
&nbsp; &nbsp;Executed : cat /etc/version</font><br><font size=3D2 face=3D"s=
ans-serif">----------------------------------------------------------------=
----------------------------------------</font><br><font size=3D2 face=3D"s=
ans-serif">20160716161753</font><br><font size=3D2 face=3D"sans-serif">----=
---------------------------------------------------------------------------=
-------------------------</font><br><br><font size=3D2 face=3D"sans-serif">=
---------------------------------------------------------------------------=
-----------------------------</font><br><font size=3D2 face=3D"sans-serif">=
DRIVER INFO : OS Details &nbsp; &nbsp;
&nbsp; &nbsp;Executed : uname -a</font><br><font size=3D2 face=3D"sans-seri=
f">------------------------------------------------------------------------=
--------------------------------</font><br><font size=3D2 face=3D"sans-seri=
f">Linux barreleye 4.6.4-openbmc-20160713-1
#1 Wed Jul 13 16:38:10 UTC 2016 armv5tejl GNU/Linux</font><br><font size=3D=
2 face=3D"sans-serif">-----------------------------------------------------=
---------------------------------------------------</font><br><br><font siz=
e=3D2 face=3D"sans-serif">-------------------------------------------------=
-------------------------------------------------------</font><br><font siz=
e=3D2 face=3D"sans-serif">DRIVER INFO : FW Level &nbsp;Executed
: cat /etc/os-release</font><br><font size=3D2 face=3D"sans-serif">--------=
---------------------------------------------------------------------------=
---------------------</font><br><font size=3D2 face=3D"sans-serif">ID=3D&qu=
ot;openbmc-phosphor&quot;</font><br><font size=3D2 face=3D"sans-serif">NAME=
=3D&quot;Phosphor OpenBMC (Phosphor
OpenBMC Project Reference Distro)&quot;</font><br><font size=3D2 face=3D"sa=
ns-serif">VERSION=3D&quot;0.1.0 (krogoth)&quot;</font><br><font size=3D2 fa=
ce=3D"sans-serif">VERSION=5FID=3D&quot;v1.0-89-g5bc571e-dirty&quot;</font><=
br><font size=3D2 face=3D"sans-serif">PRETTY=5FNAME=3D&quot;Phosphor OpenBM=
C (Phosphor
OpenBMC Project Reference Distro) 0.1.0 (krogoth)&quot;</font><br><font siz=
e=3D2 face=3D"sans-serif">BUILD=5FID=3D&quot;v1.0&quot;</font><br><font siz=
e=3D2 face=3D"sans-serif">-------------------------------------------------=
-------------------------------------------------------</font><br><br><font=
 size=3D2 face=3D"sans-serif">---------------------------------------------=
-----------------------------------------------------------</font><br><font=
 size=3D2 face=3D"sans-serif">BMC DATA : System journal log &nbsp;
Executed : journalctl --no-pager</font><br><font size=3D2 face=3D"sans-seri=
f">------------------------------------------------------------------------=
--------------------------------</font><br><font size=3D2 face=3D"sans-seri=
f">-- Logs begin at Mon 2016-07-11 22:01:17
UTC, end at Tue 2016-07-12 10:45:00 UTC. --</font><br><font size=3D2 face=
=3D"sans-serif">Jul 11 22:01:17 barreleye systemd-journald[395]:
Runtime journal (/run/log/journal/) is 3.1M, max 25.1M, 22.0M free.</font><=
br><font size=3D2 face=3D"sans-serif">Jul 11 22:01:17 barreleye kernel: Boo=
ting
Linux on physical CPU 0x0</font><br><font size=3D2 face=3D"sans-serif">Jul =
11 22:01:17 barreleye kernel: Linux
version 4.6.4-openbmc-20160713-1 (jenkins@hudson) (gcc version 4.9.3 (GCC)
) #1 Wed Jul 13 16:38:10 UTC 2016</font><br><font size=3D2 face=3D"sans-ser=
if">Jul 11 22:01:17 barreleye kernel: CPU:
ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D0005317f</font><br><font =
size=3D2 face=3D"sans-serif">...</font><br><font size=3D2 face=3D"sans-seri=
f">....</font><br><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </font><br><br><font size=
=3D2 face=3D"sans-serif">FFDC Wish List :</font><br><br><font size=3D2 face=
=3D"sans-serif">For now we are delivering only for open
BMC. The base infrastructure is kept generic and simple to extend for Open
Power test framework once the porting is complete to ROBOT framework.</font=
><br><br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; *
Wish list from Open BMC</font><br><font size=3D2 face=3D"sans-serif">&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; - journalctl --no-pager</font><br><font size=3D2 face=
=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; - bmc fw level (version)</font><br><br><font size=3D2 =
face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; *
Wish list from Open power</font><br><font size=3D2 face=3D"sans-serif">&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; - sel clear/list</font><br><font size=3D2 face=3D"sans=
-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; - sensor list</font><br><font size=3D2 face=3D"sans-se=
rif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; - Inventory</font><br><font size=3D2 face=3D"sans-seri=
f">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; - SOL output</font><br><font size=3D2 face=3D"sans-ser=
if">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; - Driver Name</font><br><font size=3D2 face=3D"sans-se=
rif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; - System ID (MTMS)</font><br><font size=3D2 face=3D"sa=
ns-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; - System Type</font><br><font size=3D2 face=3D"sans-se=
rif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; - esel support (parsing) </font><br><br><br><br><font =
size=3D2 color=3Dblue face=3D"sans-serif"><b>Thanks and Regards,</b></font>=
<br><font size=3D2 color=3Dblue face=3D"sans-serif">George Keishing</font><=
br><font size=3D2 color=3Dblue face=3D"sans-serif">IBM Systems &amp;Technol=
ogy
Lab, Firmware Development,</font><br><font size=3D2 face=3D"sans-serif"><i>=
=1B$B!H=1B(B</i></font><font size=3D3>There isn't
enough time in a day to be lazy!!! </font><font size=3D1 face=3D"sans-serif=
">.=1B$B!I=1B(B</font><br><BR>
--=_alternative 002DD99065257FF7_=--
