Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sCctn4BkqzDr3S
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 00:14:25 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u7FEAJc6079574
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 10:14:22 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 24th40ctag-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 10:14:22 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Mon, 15 Aug 2016 08:14:21 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 15 Aug 2016 08:14:18 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: anoo@linux.vnet.ibm.com
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id C1EDA19D805C
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 08:13:45 -0600 (MDT)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u7FEECA613959640
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 07:14:12 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 190896A03C
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 08:14:12 -0600 (MDT)
Received: from macbook-pro.austin.ibm.com (unknown [9.53.179.153])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS id EDAF76A03B
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 08:14:11 -0600 (MDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_7CC1929F-3E50-4779-AA93-A7D63BF4783B"
Subject: Power button behavior
Date: Mon, 15 Aug 2016 09:12:02 -0500
To: openbmc@lists.ozlabs.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16081514-0012-0000-0000-00001065EBE1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005598; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000181; SDB=6.00744980; UDB=6.00351043; IPR=6.00517532; 
 BA=6.00004662; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012338; XFM=3.00000011;
 UTC=2016-08-15 14:14:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16081514-0013-0000-0000-0000448F4FCD
Message-Id: <3743F858-80C3-457F-9B3B-86ED896FA16F@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-15_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1608150158
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
X-List-Received-Date: Mon, 15 Aug 2016 14:14:26 -0000


--Apple-Mail=_7CC1929F-3E50-4779-AA93-A7D63BF4783B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello community,

The current openBMC behavior for the power buttion is:
Short press triggers a hard power off, long press reboots the host =
(power off->power on).

The default behavior for P8 OpenPower systems / x86 is:
Short press triggers a soft power off, long press triggers a hard power =
off.

The proposal is to change the openBMC behavior to the default P8/x86 one =
for master and the stable branch supported on Barreleye, any thoughts or =
objections?=

--Apple-Mail=_7CC1929F-3E50-4779-AA93-A7D63BF4783B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"margin: 0px; font-size: 10px; line-height: =
normal; font-family: 'Lucida Grande';" class=3D"">Hello =
community,</div><div style=3D"margin: 0px; font-size: 10px; line-height: =
normal; font-family: 'Lucida Grande'; min-height: 12px;" class=3D""><br =
class=3D""></div><div style=3D"margin: 0px; font-size: 10px; =
line-height: normal; font-family: 'Lucida Grande';" class=3D"">The =
current openBMC behavior for the power buttion is:</div><div =
style=3D"margin: 0px; font-size: 10px; line-height: normal; font-family: =
'Lucida Grande';" class=3D"">Short press triggers a hard power off, long =
press reboots the host (power off-&gt;power on).</div><div =
style=3D"margin: 0px; font-size: 10px; line-height: normal; font-family: =
'Lucida Grande'; min-height: 12px;" class=3D""><br class=3D""></div><div =
style=3D"margin: 0px; font-size: 10px; line-height: normal; font-family: =
'Lucida Grande';" class=3D"">The default behavior for P8 OpenPower =
systems / x86 is:</div><div style=3D"margin: 0px; font-size: 10px; =
line-height: normal; font-family: 'Lucida Grande';" class=3D"">Short =
press triggers a soft power off, long press triggers a hard power =
off.</div><div style=3D"margin: 0px; font-size: 10px; line-height: =
normal; font-family: 'Lucida Grande'; min-height: 12px;" class=3D""><br =
class=3D""></div><div style=3D"margin: 0px; font-size: 10px; =
line-height: normal; font-family: 'Lucida Grande';" class=3D"">The =
proposal is to change the openBMC behavior to the default P8/x86 one for =
master and the stable branch supported on Barreleye, any thoughts or =
objections?</div></body></html>=

--Apple-Mail=_7CC1929F-3E50-4779-AA93-A7D63BF4783B--
