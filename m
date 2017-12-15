Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyd6M3XcbzDrWk
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 15:40:59 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBF4dSK6092571
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 23:40:56 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ev6p91pe4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 23:40:55 -0500
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 14 Dec 2017 23:40:55 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 14 Dec 2017 23:40:54 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBF4erai46465084; Fri, 15 Dec 2017 04:40:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEC03112047;
 Thu, 14 Dec 2017 23:39:11 -0500 (EST)
Received: from birb.localdomain (unknown [9.102.53.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with SMTP id C8693112034;
 Thu, 14 Dec 2017 23:39:10 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id A93A94EC6A2; Fri, 15 Dec 2017 15:40:50 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Andrew Geissler <geissonator@gmail.com>, Michael Tritz <mtritz@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Host factory reset - version priorities
In-Reply-To: <CALLMt=pVW5N4=PbKaM8XOws-vQcii23vCutC4zPzpW_5tmH0-w@mail.gmail.com>
References: <OF113B399A.B511E757-ON002581ED.0019E0EA-002581ED.0019FDF6@notes.na.collabserv.com>
 <CALLMt=pVW5N4=PbKaM8XOws-vQcii23vCutC4zPzpW_5tmH0-w@mail.gmail.com>
Date: Fri, 15 Dec 2017 15:40:50 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17121504-2213-0000-0000-0000024AB411
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008206; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00960405; UDB=6.00485793; IPR=6.00740420; 
 BA=6.00005741; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018553; XFM=3.00000015;
 UTC=2017-12-15 04:40:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121504-2214-0000-0000-000058726E86
Message-Id: <871sjwwqlp.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-15_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712150064
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
X-List-Received-Date: Fri, 15 Dec 2017 04:41:00 -0000

Andrew Geissler <geissonator@gmail.com> writes:
> On Mon, Dec 4, 2017 at 10:43 PM, Michael Tritz <mtritz@us.ibm.com> wrote:
>> What should be happening on a host factory reset?
>>
>> Suppose we have a machine with two host versions uploaded - one active, one
>> not. Currently, the host factory reset will clear the persistence files with
>> which we store the priority information for these versions. The next time
>> the host software updater is started, both versions are left with priority
>> of 255, and one of the two (maybe it's random, maybe it's based on upload
>> order) is selected as the active host version.
>>
>> Is this the desired behavior? Would it be better to instead retain the
>> version priority through a reset, or is clearing that setting under the
>> scope of "restoring factory settings"?
>
> I do not thing we want to lose the priority on a factory reset.  We
> have to ensure we always
> use the firmware level that the user last activated, no matter what.
> The "spirit" of a factory
> reset is to clear any changes done by the user to defaults of the
> firmware.  Ensuring we boot with the right
> level of firmware is still required after a factory reset.

I'm with Andrew on this one, I would think that it should keep the
current firmware versions and the current priorities of them.

*IF* we had the concept of something like a factory or golden image,
then *maybe* it would make sense to reset to it. But considering we
don't have that (at least currently), I think the behaviour should be to
reset everything as if the machine came out of the factory with the
currently active images loaded (i.e. do *not* reset priorities).

-- 
Stewart Smith
OPAL Architect, IBM.
