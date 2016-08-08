Return-Path: <shliyi@cn.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s71WN3LFfzDqYt
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 12:26:39 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u782OCEF015730
 for <openbmc@lists.ozlabs.org>; Sun, 7 Aug 2016 22:26:37 -0400
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0b-001b2d01.pphosted.com with ESMTP id 24n9gy399r-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2016 22:26:36 -0400
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 8 Aug 2016 12:26:33 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 8 Aug 2016 12:26:32 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 9620C3578052
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 12:26:31 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u782QVe825624724
 for <openbmc@lists.ozlabs.org>; Mon, 8 Aug 2016 12:26:31 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u782QVft024473
 for <openbmc@lists.ozlabs.org>; Mon, 8 Aug 2016 12:26:31 +1000
Received: from d50lp33.co.us.ibm.com (d50lp33.boulder.ibm.com [9.17.249.38])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u782QT85024279
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 8 Aug 2016 12:26:31 +1000
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Sun, 7 Aug 2016 20:26:29 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Sun, 7 Aug 2016 20:26:27 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 8 Aug 2016 02:26:26 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 8 Aug 2016 02:26:24 -0000
X-IBM-Helo: us1a3-smtp05.a3.dal06.isc4sb.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: joel@jms.id.au;openbmc@lists.ozlabs.org
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016080802262432-142179 ;
 Mon, 8 Aug 2016 02:26:24 +0000 
MIME-Version: 1.0
Subject: aspeed i2c multi-master mode
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Mon, 8 Aug 2016 10:26:04 +0800
X-KeepSent: D1661B1E:7722FD0E-48258009:000CAEA2;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 35319
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=C7BB0A9ADF9F28328f9e8a93df938690918cC7BB0A9ADF9F2832"
Content-Disposition: inline
x-cbid: 16080802-0044-0000-0000-000001CB21C3
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0.000242; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005563; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000178; SDB=6.00741525; UDB=6.00348928; UTC=2016-08-08
 02:26:25
x-cbparentid: 16080802-7094-0000-0000-000000E21E5B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFD1661B1E.7722FD0E-ON48258009.000CAEA2-48258009.000D5F9B@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-08_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 spamscore=1 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1608080026
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
X-List-Received-Date: Mon, 08 Aug 2016 02:26:41 -0000


--0__=C7BB0A9ADF9F28328f9e8a93df938690918cC7BB0A9ADF9F2832
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Hi Joel and the List,

Does current Aspeed I2C driver support multi-master mode?
I checked the ASPEED data sheet, the aspeed2400 and aspeed2500 HW support
I2C multi-master mode.
Do we need to add code in i2c driver to enable multi-master mode?

Regards,
Yi Li (Adam)

--0__=C7BB0A9ADF9F28328f9e8a93df938690918cC7BB0A9ADF9F2832
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Hi Joel and the List,<br><br>Does current Aspeed I2C driver =
support multi-master mode?<br>I checked the ASPEED data sheet, the aspeed24=
00 and aspeed2500 HW support I2C multi-master mode.<br>Do we need to add co=
de in i2c driver to enable multi-master mode?<br><br>Regards,<br>Yi Li (Ada=
m)<BR>
</body></html>

--0__=C7BB0A9ADF9F28328f9e8a93df938690918cC7BB0A9ADF9F2832--
