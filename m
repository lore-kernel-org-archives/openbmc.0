Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43vMyp2lLMzDqNW
 for <openbmc@lists.ozlabs.org>; Wed,  6 Feb 2019 11:39:30 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x160dSZH090247
 for <openbmc@lists.ozlabs.org>; Tue, 5 Feb 2019 19:39:28 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qfmq51bxy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 Feb 2019 19:39:27 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Wed, 6 Feb 2019 00:39:23 -0000
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 6 Feb 2019 00:39:21 -0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x160dKGk28442854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Feb 2019 00:39:20 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ADD9C6059;
 Wed,  6 Feb 2019 00:39:20 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C8F5C6055;
 Wed,  6 Feb 2019 00:39:20 +0000 (GMT)
Received: from birb.localdomain (unknown [9.185.142.92])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  6 Feb 2019 00:39:19 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id C84AE4EC62C; Wed,  6 Feb 2019 11:39:18 +1100 (AEDT)
From: Stewart Smith <stewart@linux.ibm.com>
To: Alexander Amelkin <a.amelkin@yadro.com>, Lei YU <mine260309@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Romulus to use Virtual PNOR
In-Reply-To: <fdc48c10-5dc1-0fca-7b7c-d150307b9a37@yadro.com>
References: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
 <fdc48c10-5dc1-0fca-7b7c-d150307b9a37@yadro.com>
Date: Wed, 06 Feb 2019 11:39:18 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19020600-0020-0000-0000-00000EB73D11
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010544; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01156880; UDB=6.00603507; IPR=6.00937405; 
 MB=3.00025451; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-06 00:39:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020600-0021-0000-0000-000064B1537A
Message-Id: <87o97piwcp.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-05_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902060002
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2019 00:39:30 -0000

Alexander Amelkin <a.amelkin@yadro.com> writes:
> 25.01.2019 10:40, Lei YU wrote:
>> This email is to notify that Romulus is going to use VirtualPNOR feature, if
>> no objections are received.
>>
>> It **impacts** to existing Romulus systems, that they must do PNOR code update
>> when the feature is enabled.
>>
>> A little background on this topic could be found at:
>> https://lists.ozlabs.org/pipermail/openbmc/2018-May/011822.html
>> https://lists.ozlabs.org/pipermail/openbmc/2018-November/014112.html
>>
>> I did not receive any feedback, so I choose to use VritualPNOR feature,
>> which has below benefits:
>> 1. It requires minor code changes for a system to switch to VirtualPNOR;
>> 2. It gets full features, including PNOR version, code verification, and code
>>    update via new interface;
>> 3. When OpenBMC switches to Redfish, it will get Redfish code update for free,
>>    because IBM will implement Redfish code update based on VirtualPNOR.
>>
>> The related changes are:
>> * OpenBMC: https://gerrit.openbmc-project.xyz/#/q/topic:ubifs-pnor-for-romulus
>> * op-build: https://github.com/open-power/op-build/pull/2578
>>
>> Any objections?
>
> Well, the main concern is how it will affect vesnin, which is P8-based (like palmetto).
>
> All this virtual PNOR functionality is based on mbox/hiomap, which is
> not supported for P8 in openpower firmware.

For various reasons, this is now changing, so you'll be able to do hiomap
on P8.

> As a result, we suspect that palmetto and (what concerns us most)
> vesnin will lose firmware update support completely.

I think this is a valid concern, and I'd be concerned if there's tight
coupling between VPNOR and the firmware update APIs.

-- 
Stewart Smith
OPAL Architect, IBM.
