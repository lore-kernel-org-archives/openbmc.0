Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vrgc74fmQzDq7c
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 02:11:51 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2QF8bss066689
 for <openbmc@lists.ozlabs.org>; Sun, 26 Mar 2017 11:11:45 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29dn2t7a8u-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 26 Mar 2017 11:11:45 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sun, 26 Mar 2017 09:11:44 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 26 Mar 2017 09:11:42 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2QFBgTM9175460
 for <openbmc@lists.ozlabs.org>; Sun, 26 Mar 2017 08:11:42 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C5E978041
 for <openbmc@lists.ozlabs.org>; Sun, 26 Mar 2017 09:11:42 -0600 (MDT)
Received: from e39.co.us.ibm.com (unknown [9.17.249.49])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS id EB0987803F
 for <openbmc@lists.ozlabs.org>; Sun, 26 Mar 2017 09:11:41 -0600 (MDT)
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sun, 26 Mar 2017 09:11:41 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Sun, 26 Mar 2017 09:11:38 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sun, 26 Mar 2017 15:11:37 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 26 Mar 2017 15:11:35 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2017032615113486-155289 ;
 Sun, 26 Mar 2017 15:11:34 +0000 
MIME-Version: 1.0
Subject: netbooting with Fit images
To: "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
From: "Chris Austen" <austenc@us.ibm.com>
Date: Sun, 26 Mar 2017 09:11:40 -0600
X-KeepSent: 4AEF9BB3:2CC1F4C2-862580ED:007DF187;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 62295
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0A7EDFEE77178f9e8a93df938690918c09BB0A7EDFEE7717"
Content-Disposition: inline
x-cbid: 17032615-0016-0000-0000-000006717142
X-IBM-SpamModules-Scores: BY=0.000048; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.024852
X-IBM-SpamModules-Versions: BY=3.00006853; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00839016; UDB=6.00412744; IPR=6.00616916; 
 BA=6.00005237; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014814; XFM=3.00000013;
 UTC=2017-03-26 15:11:36
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-03-26 11:33:54 - 6.00006501
x-cbparentid: 17032615-0328-0000-0000-0000034E3182
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006853; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00839017; UDB=6.00412744; IPR=6.00616916; 
 BA=6.00005237; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014814; XFM=3.00000013;
 UTC=2017-03-26 15:11:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF4AEF9BB3.2CC1F4C2-ON862580ED.007DF187-862580EF.00537731@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-26_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703260141
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Mar 2017 15:11:52 -0000


--0__=09BB0A7EDFEE77178f9e8a93df938690918c09BB0A7EDFEE7717
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


From a uboot prompt I use to be able to netboot the kernel and user space.
Is there a new way to do that now with Fit images?


Chris Austen
POWER Systems Enablement Manager
(512) 286-5184 (T/L: 363-5184)

--0__=09BB0A7EDFEE77178f9e8a93df938690918c09BB0A7EDFEE7717
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">From a uboot prompt I use to be able to net=
boot the kernel and user space.  Is there a new way to do that now with Fit=
 images? </font><br><br><font size=3D"2"><br>Chris Austen<br>POWER Systems =
Enablement Manager <br>(512) 286-5184 (T/L: 363-5184)</font><BR>
</body></html>

--0__=09BB0A7EDFEE77178f9e8a93df938690918c09BB0A7EDFEE7717--
