Return-Path: <gmills@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43z7w62GMrzDqPY
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 14:50:14 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1C3j2WL137724
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 22:50:11 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qkmk6ks6x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 22:50:11 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Tue, 12 Feb 2019 03:50:10 -0000
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 12 Feb 2019 03:50:08 -0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1C3o7iV17825904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Feb 2019 03:50:07 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7854112064;
 Tue, 12 Feb 2019 03:50:07 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 635DF112069;
 Tue, 12 Feb 2019 03:50:06 +0000 (GMT)
Received: from [9.81.210.200] (unknown [9.81.210.200])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 12 Feb 2019 03:50:05 +0000 (GMT)
Subject: Re: Using Stale bot to clean up issues
To: krtaylor <kurt.r.taylor@gmail.com>, openbmc@lists.ozlabs.org
References: <01b53196-6c78-b004-8cd0-8534c516cbaf@linux.vnet.ibm.com>
 <df81f451-6982-6fd8-8acd-ab24b8f4c88f@intel.com>
 <5f203acc-f41d-cbae-1b1d-4c0af9d51b6e@linux.vnet.ibm.com>
 <9384d805-8ce2-a3b9-4406-06cf4f775306@gmail.com>
From: GUNNAR MILLS <gmills@linux.vnet.ibm.com>
Date: Mon, 11 Feb 2019 21:50:04 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <9384d805-8ce2-a3b9-4406-06cf4f775306@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19021203-0072-0000-0000-000003F89B4A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010580; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01159797; UDB=6.00605272; IPR=6.00940346; 
 MB=3.00025537; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-12 03:50:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021203-0073-0000-0000-00004B271987
Message-Id: <17b83fbc-247f-dee2-9fc3-2dd3efdee670@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-12_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902120026
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
X-List-Received-Date: Tue, 12 Feb 2019 03:50:15 -0000


On 2/11/2019 5:41 PM, krtaylor wrote:
>
> As long as the issue is closed and not deleted. I just want someone to 
> be able to find an issue and reopen it, and retain all the previous 
> discussion history. Of course, that assumes that someone will search 
> closed issues before opening a new one, but still.
>
Yeah, they will just be closed, not deleted and my thought was to start 
pretty lax.

Don't touch them until 6 months of inactively and then another month of 
inactively in this "stale" state before closing. We can revisit this later.


>
> Where are you planning on hosting it?
>
No need to host it anywhere. It is a GitHub App.
https://developer.github.com/apps/about-apps/#about-github-apps

I installed it on a personal repository, just a couple clicks!

Need to be "an organization owner or have admin permissions in a 
repository to install a GitHub App".  Will then need a .github/stale.yml

- Gunnar
