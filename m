Return-Path: <gmills@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420GNH6dj2zDrtm
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 03:44:31 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7SHdOYJ054437
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 13:44:29 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2m586xqn1y-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 13:44:29 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Tue, 28 Aug 2018 13:44:28 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 28 Aug 2018 13:44:25 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7SHiPJN47251560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Aug 2018 17:44:25 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CC96AC05E;
 Tue, 28 Aug 2018 13:44:28 -0400 (EDT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 641CFAC05B;
 Tue, 28 Aug 2018 13:44:28 -0400 (EDT)
Received: from [9.10.100.197] (unknown [9.10.100.197])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 28 Aug 2018 13:44:28 -0400 (EDT)
Subject: Re: Proposals for commit log policy
To: Andrew Geissler <geissonator@gmail.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <CACPK8XdtitrjvDpuiPiz_ew03m972ueGRXAhd4kM_z6YSVtL3A@mail.gmail.com>
 <0E782585-1B8A-4BF7-9454-443061BA9C32@fuzziesquirrel.com>
 <CALLMt=rGmZ9-29xWMymUvdCAgVnFzQ+gyZDn3zXnWeR4imSYPA@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Date: Tue, 28 Aug 2018 12:44:25 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CALLMt=rGmZ9-29xWMymUvdCAgVnFzQ+gyZDn3zXnWeR4imSYPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18082817-0060-0000-0000-000002A59A65
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009628; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01080167; UDB=6.00557150; IPR=6.00860151; 
 MB=3.00022981; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-28 17:44:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18082817-0061-0000-0000-00004652246B
Message-Id: <359bcf51-5732-a65b-4b7e-dba2df0dd375@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-28_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=881 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808280175
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2018 17:44:32 -0000

On 8/28/2018 10:43 AM, Andrew Geissler wrote:

> On Tue, Aug 28, 2018 at 5:30 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>> I plan on simply _not_ turning it back on, and let maintainers do their own
>> bumps like Joel has been doing for the kernel moving forward (Thanks Joel).
>> Unless there are major objections.
> I object!  At least 90% of the auto bumps today go through without
> issue.  This keeps our openbmc/openbmc master consistently up to date
> which I think is a big benefit to our community.  We're able to
> quickly find regressions with our automated tests which are constantly
> running against the new content coming in. I feel like we're adding
> more work with minimal benefit here.

I object too. I don't think the benefit of manual bumps is worth the effort.

Thanks,
Gunnar
