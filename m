Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ttWNj07KYzDqGL
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jan 2017 11:08:04 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0404CiV031244
 for <openbmc@lists.ozlabs.org>; Tue, 3 Jan 2017 19:08:02 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27rd3xxpv4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jan 2017 19:08:02 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 3 Jan 2017 17:08:02 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 3 Jan 2017 17:07:59 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id DC6D83E4003E;
 Tue,  3 Jan 2017 17:07:58 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0407wBi10879286; Tue, 3 Jan 2017 17:07:58 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7B126A041;
 Tue,  3 Jan 2017 17:07:58 -0700 (MST)
Received: from birb.localdomain (unknown [9.83.6.89])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with SMTP id 989B36A03C;
 Tue,  3 Jan 2017 17:07:57 -0700 (MST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 4ADEA2298245; Wed,  4 Jan 2017 11:07:55 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Andrew Geissler <geissonator@gmail.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: jdking@us.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: BMC and Host State Management Refactor
In-Reply-To: <CALLMt=o6td6kAprcHxTyq628mrDk-aAXaK-D_0A9kA+iwVUbUA@mail.gmail.com>
References: <CALLMt=oZ7neAge4of5KwzEQbA9nZ_ayuaYwFyUPGqN14Oq-5fA@mail.gmail.com>
 <CACPK8XebH8SnRGkxqSHS=QN1PYyWL2vt-NBw-sNA6d8qL6ZCEw@mail.gmail.com>
 <CALLMt=pUaq39-YtUQgOcwPOzzhFM8pOB2LgML02uifpKCT3_5Q@mail.gmail.com>
 <1479786054.2503.23.camel@aj.id.au>
 <CALLMt=rNQSyYX6m--TKns1Hf1frFVmCfE+M77RVcADD8QyfuPg@mail.gmail.com>
 <1479863279.2503.42.camel@aj.id.au>
 <CALLMt=rMsUO4yKw9Cs5PVU67dE34Ru-WL+rfE67OtD9t-NKiow@mail.gmail.com>
 <CALLMt=o6td6kAprcHxTyq628mrDk-aAXaK-D_0A9kA+iwVUbUA@mail.gmail.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/25.1.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 04 Jan 2017 11:07:55 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17010400-0028-0000-0000-0000065F89E8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006368; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000199; SDB=6.00803143; UDB=6.00390685; IPR=6.00580993; 
 BA=6.00005028; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013815; XFM=3.00000011;
 UTC=2017-01-04 00:08:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17010400-0029-0000-0000-000032193CF1
Message-Id: <87zij7r8kk.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-03_21:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701040000
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
X-List-Received-Date: Wed, 04 Jan 2017 00:08:05 -0000

Andrew Geissler <geissonator@gmail.com> writes:
> 4. Provide a softReboot and hardReboot option in the host state code.
> The hardReboot would do the chassis power off (hard power off) and
> then power on.  The softReboot will work as expected and issue the
> soft power down command to the host.
> - Seems like a happy compromise in where the logic goes.  Checkstop is
> smart enough to know it needs a hardReboot and host state code knows
> how to do it.

So, we also have fast reset, which is different again, mostly in that it
has slightly different security implications.

So, we have power (off|cycle) with hard/soft shutdown and we have reboot with
hard/soft shutdown.

At least on other platforms, I think there's a similar concept, as I've
noticed that on many x86 systems if you don't cut the power on reboot,
you skip some of the POST....

thougths?

-- 
Stewart Smith
OPAL Architect, IBM.
