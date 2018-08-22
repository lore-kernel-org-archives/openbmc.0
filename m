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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wfLD5v71zF2FM
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 06:30:09 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7MFAeaj081783
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 11:11:47 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2m17s7qaqf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 11:11:46 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Wed, 22 Aug 2018 09:01:35 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 22 Aug 2018 09:01:32 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7MF1V2S60162116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 Aug 2018 08:01:31 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAAF813604F;
 Wed, 22 Aug 2018 09:01:31 -0600 (MDT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D1CA13605E;
 Wed, 22 Aug 2018 09:01:31 -0600 (MDT)
Received: from [9.10.223.118] (unknown [9.10.223.118])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 22 Aug 2018 09:01:31 -0600 (MDT)
Subject: Re: Proposals for commit log policy
To: Alexander Amelkin <a.amelkin@yadro.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Date: Wed, 22 Aug 2018 10:01:33 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18082215-0020-0000-0000-00000E553777
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009592; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01077245; UDB=6.00555391; IPR=6.00857221; 
 MB=3.00022869; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-22 15:01:33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18082215-0021-0000-0000-000062C425F7
Message-Id: <89b9dac7-b4ae-6eb7-c364-f7788b86b59f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808220154
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
X-List-Received-Date: Wed, 22 Aug 2018 20:30:13 -0000

Hi Alexander,

On 8/21/2018 7:29 AM, Alexander Amelkin wrote:
> Thankfully, for linux-obmc version bumps Patrick Williams and Joel Stanley do a great job by including the 'git shortlog' output. Unfortunately, not everyone is following this rule for bumps.
The autobump tool is here: 
https://github.com/openbmc/openbmc-tools/blob/master/infra/autobump.pl
Could you enhance to have the ‘git shortlog’ in the commit message?
> Now for item 1, it would be great if we could have a mandatory "End-user-impact" line/section, like these added to the following real commits:
>
I really oppose another field/section in each commit. We already have a 
"tested" field. What happens when someone else wants a field for what 
systems this commit effects? This might be a bad example but hopefully, 
you see my point. :)

- Gunnar

> Alexander.
