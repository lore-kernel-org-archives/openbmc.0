Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zKZtj6wWgzF0Zf
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jan 2018 12:06:37 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0F14Lwr043060
 for <openbmc@lists.ozlabs.org>; Sun, 14 Jan 2018 20:06:35 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fg00kfwfy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 14 Jan 2018 20:06:35 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Sun, 14 Jan 2018 18:06:34 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 14 Jan 2018 18:06:32 -0700
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0F16WP612190182; Sun, 14 Jan 2018 18:06:32 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17ED37803F;
 Sun, 14 Jan 2018 18:06:32 -0700 (MST)
Received: from birb.localdomain (unknown [9.81.219.230])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with SMTP id 10BA478037;
 Sun, 14 Jan 2018 18:06:30 -0700 (MST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 960C74EC5DC; Mon, 15 Jan 2018 12:06:29 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Andrew Geissler <geissonator@gmail.com>, ed.tanous@intel.com,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: openbmc coding standards validation in CI
In-Reply-To: <CALLMt=oxScYiG4J-Ms367nqtv_cdZURoiCsa2jz9LH6=n2fRVA@mail.gmail.com>
References: <CALLMt=oxScYiG4J-Ms367nqtv_cdZURoiCsa2jz9LH6=n2fRVA@mail.gmail.com>
Date: Mon, 15 Jan 2018 12:06:29 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18011501-0008-0000-0000-0000092B3B48
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008378; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000245; SDB=6.00975127; UDB=6.00494200; IPR=6.00755055; 
 BA=6.00005775; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019038; XFM=3.00000015;
 UTC=2018-01-15 01:06:33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18011501-0009-0000-0000-0000458DC9C6
Message-Id: <87r2qs3p7u.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-14_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801150014
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jan 2018 01:06:38 -0000

Andrew Geissler <geissonator@gmail.com> writes:
> During the hackathon meetup, we decided to try and get something in
> our CI jobs that would validate the code formatting and automatically
> -1 the gerrit commit if it's not up to par.  The reasoning behind this
> is we still have a lot of code review comments coming in this area,
> which is wasteful for the reviewers.
>
> Ed, Adriana, and I all worked different pieces of it.  We're using the
> clang-format tool to format (and then validate the format).  The idea
> is you do the initial run of the tool against your repo and check the
> .clang-format file in with your changes.  The presence of the file
> will cause the CI job to validate the code formatting.  After the
> .clang-format is merged, CI jobs will fail if the new code doesn't
> follow the standard.  The CI jenkins job will output the diff of the
> code that is not conforming to the console.
>
> We've tried our best to get the .clang-format file to match up with
> our requirements in
> https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md.
>
> The .clang-format file and the changes it did to the sdbusplus repo
> can be found in https://gerrit.openbmc-project.xyz/#/c/8461/.  Review
> comments appreciated.

Oh neat!

I gather the CI job is something like "parallel clang-format -i {} :::
`find . -name '*.c' -name '*.cpp' -name '*.h'`" and then check for any
changes?

-- 
Stewart Smith
OPAL Architect, IBM.
