Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 401CV15B6hzF12P
 for <openbmc@lists.ozlabs.org>; Wed, 14 Mar 2018 11:37:13 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2E0YaKX090354
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 20:37:10 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2gprea9jpn-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 20:37:10 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 13 Mar 2018 18:37:09 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 13 Mar 2018 18:37:06 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2E0b6v75112188; Tue, 13 Mar 2018 17:37:06 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EBFCBE042;
 Tue, 13 Mar 2018 18:37:06 -0600 (MDT)
Received: from birb.localdomain (unknown [9.102.58.185])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP id 06F4ABE03B;
 Tue, 13 Mar 2018 18:37:03 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 81DA14EC62A; Wed, 14 Mar 2018 11:36:56 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, geissonator@gmail.com,
 anoo@linux.vnet.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Parse PELs sent by OpenPOWER host firmware
In-Reply-To: <2815fac8-3a1f-d2ed-3c3d-ca7072de9db2@linux.vnet.ibm.com>
References: <2815fac8-3a1f-d2ed-3c3d-ca7072de9db2@linux.vnet.ibm.com>
Date: Wed, 14 Mar 2018 11:36:56 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18031400-0020-0000-0000-00000D965641
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008668; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01002674; UDB=6.00510214; IPR=6.00782004; 
 MB=3.00020017; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-14 00:37:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031400-0021-0000-0000-0000607BEC17
Message-Id: <87vadzo5lj.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-13_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803140003
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2018 00:37:14 -0000

Deepak Kodihalli <dkodihal@linux.vnet.ibm.com> writes:
> The SELs/eSELs (System Event Log) that OpenBMC receives from 
> hostboot/skiboot today are not interpreted, and are dumped as-is in a 
> property of the error log D-Bus object. This means that if there's a PEL 
> (Platform Event Log) hidden in the eSEL, admins/users of the error log 
> need to depend on external tools to parse the PEL to human readable
> text.

My lack of love for PELs is probably fairly well known, but even if we
replace them down the line, I think there's opportunity here for making
things better for users (including myself).

> Here's a proposal to have the BMC itself parse such eSELs (the 
> motivation is to make the OpenBMC error logs more useful in this 
> context, without needing the extra steps to parse such errors) :
>
> - Separate this from phosphor-logging. This code can't go to a phosphor 
> app, because it's OpenPOWER specific. Have, for example, an 
> openpower-logging app implement a D-Bus interface to parse out a PEL 
> from an eSEL. This app will host it's own D-Bus service.

It would be a bonus if we could take different actions based on log
format. If in the future we had a hypothetical other format, it'd be
great if it was *really* easy to plug into OpenBMC. I suspect other
platforms may have similar things (e.g. Google has done protobuf based
logs in the past at least, which are structurally somewhat similar to
PELs but different serialisation format).

> - Such an app can watch for error D-Bus objects being created in the 
> phosphor namespace. If it finds an eSEL in an error log, it can attempt 
> to parse a PEL (if there's one), and store the PELs parsed text 
> representation in a D-Bus property.
>
> - The app can create a D-Bus object with the same path as the original 
> object and have a D-Bus object-manager at the error log root path, so 
> that when someone uses the OpenBMC REST API to read an error log, 
> properties across all D-Bus services will be returned 
> (phosphor-rest-server does this today already). This means with the 
> existing REST API to enumerate error logs, a parsed PEL would be 
> returned, if present.

Is thre any reason for this approach rather than something like
phosphor-logging having a list of properties/formats and external
parsing tools? Kind of like mime type/action lists?

> - To parse the PEL, use opal-elog-parse.

+1

-- 
Stewart Smith
OPAL Architect, IBM.
