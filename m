Return-Path: <vishwanath@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rldJH626VzDqr5
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jul 2016 23:09:51 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u67D91Df091271
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jul 2016 09:09:49 -0400
Received: from e28smtp08.in.ibm.com (e28smtp08.in.ibm.com [125.16.236.8])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2415xmuaa0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jul 2016 09:09:49 -0400
Received: from localhost
 by e28smtp08.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 7 Jul 2016 18:39:45 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
 by e28smtp08.in.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 7 Jul 2016 18:39:43 +0530
X-IBM-Helo: d28dlp03.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
 by d28dlp03.in.ibm.com (Postfix) with ESMTP id 522CD125805C
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jul 2016 18:42:28 +0530 (IST)
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u67D8W0q19398954
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jul 2016 18:38:34 +0530
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 7 Jul 2016 09:09:38 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 7 Jul 2016 09:09:35 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 7 Jul 2016 13:09:34 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 7 Jul 2016 13:09:33 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016070713093280-247351 ;
 Thu, 7 Jul 2016 13:09:32 +0000 
MIME-Version: 1.0
Subject: Issues with setting the timeofday
To: OpenBMC <openbmc@lists.ozlabs.org>
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Thu, 7 Jul 2016 18:36:45 +0530
X-KeepSent: AF379D90:EBDC1ECC-65258094:0026E76B;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1 October 14, 2013
X-LLNOutbound: False
X-Disclaimed: 46607
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABB0A07DFB561FB8f9e8a93df938690918cEABB0A07DFB561FB"
Content-Disposition: inline
x-cbid: 16070713-0056-0000-0000-0000028AD7A8
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0.199692; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005462; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000172; SDB=6.00726980; UDB=6.00340171; UTC=2016-07-07
 13:09:34
x-cbparentid: 16070713-7792-0000-0000-000004454A99
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFAF379D90.EBDC1ECC-ON65258094.0026E76B-65257FE9.004807C1@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-07_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2
 spamscore=2 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607070123
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
X-List-Received-Date: Thu, 07 Jul 2016 13:09:52 -0000


--0__=EABB0A07DFB561FB8f9e8a93df938690918cEABB0A07DFB561FB
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


hey Joel,

Here is what I am seeing on one the Barreleye box that is running
"4.4.12-openbmc-20160606-1 : kernel". I can see that time gets set but
reverts immediately. Syncing what's in hwclock does not have any effect
too. Any thoughts ?

root@barreleye:~# date -s '2016-12-25 12:34:56' ; hwclock -w
Sun Dec 25 12:34:56 UTC 2016

root@barreleye:~# date
Thu Jul  7 13:07:37 UTC 2016

root@barreleye:~# hwclock -r
Sun Dec 25 12:35:01 2016  0.000000 seconds

root@barreleye:~# hwclock -s

root@barreleye:~# date
Thu Jul  7 13:07:52 UTC 2016
root@barreleye:~#

Thanks

---------------------------------------------------------------------------=
----------

Thanks and Regards,
Vishwanath.
Advisory Software Engineer,
Power Firmware Development,
Systems &Technology Lab,
MG2-6F-255 , Manyata Embassy Business Park,
Bangalore , KA , 560045
Ph: +91-80-46678255
E-mail: vishwanath@in.ibm.com
---------------------------------------------------------------------------=
-------

--0__=EABB0A07DFB561FB8f9e8a93df938690918cEABB0A07DFB561FB
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>hey Joel,<br><br>Here is what I am seeing on one the Barrele=
ye box that is running &quot;4.4.12-openbmc-20160606-1 : kernel&quot;. I ca=
n see that time gets set but reverts immediately. Syncing what's in hwclock=
 does not have any effect too. Any thoughts ?<br><br>root@barreleye:~# date=
 -s '2016-12-25 12:34:56' ; hwclock -w<br>Sun Dec 25 12:34:56 UTC 2016<br><=
br>root@barreleye:~# date<br>Thu Jul  7 13:07:37 UTC 2016<br><br>root@barre=
leye:~# hwclock -r<br>Sun Dec 25 12:35:01 2016  0.000000 seconds<br><br>roo=
t@barreleye:~# hwclock -s<br><br>root@barreleye:~# date<br>Thu Jul  7 13:07=
:52 UTC 2016<br>root@barreleye:~# <br><br>Thanks<br><br>-------------------=
------------------------------------------------------------------<br>Thank=
s and Regards,<br>Vishwanath.<br>Advisory Software Engineer,<br>Power Firmw=
are Development, <br>Systems &amp;Technology Lab,<br>MG2-6F-255 , Manyata E=
mbassy Business Park, <br>Bangalore , KA , 560045<br>Ph: +91-80-46678255<br=
>E-mail: vishwanath@in.ibm.com<br>-----------------------------------------=
-----------------------------------------<BR>
</body></html>

--0__=EABB0A07DFB561FB8f9e8a93df938690918cEABB0A07DFB561FB--
