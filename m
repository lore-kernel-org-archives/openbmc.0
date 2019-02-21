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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4454Yl4xnlzDq5Y
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 06:39:54 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1LJSjOw009204
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 14:39:52 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qt11jbj4b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 14:39:51 -0500
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Thu, 21 Feb 2019 19:39:51 -0000
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 21 Feb 2019 19:39:49 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1LJdm4Y17301610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Feb 2019 19:39:48 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AB04AC05E;
 Thu, 21 Feb 2019 19:39:48 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 164C4AC05F;
 Thu, 21 Feb 2019 19:39:48 +0000 (GMT)
Received: from [9.10.100.31] (unknown [9.10.100.31])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 21 Feb 2019 19:39:47 +0000 (GMT)
Subject: Re: Problem with license text file
To: susan jasinski <susantjasinski@gmail.com>, openbmc@lists.ozlabs.org
References: <CANT4Nr+t_s2FAov9X=0HNOqW1MfwDS6uG4ZmdvxnLUr+QO3uNg@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Date: Thu, 21 Feb 2019 13:39:49 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CANT4Nr+t_s2FAov9X=0HNOqW1MfwDS6uG4ZmdvxnLUr+QO3uNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19022119-0068-0000-0000-00000397819B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010639; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01164390; UDB=6.00608050; IPR=6.00944975; 
 MB=3.00025684; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-21 19:39:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19022119-0069-0000-0000-00004795918D
Message-Id: <acb0a1e2-5641-5d23-20a5-38a23cdf62e4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-21_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902210135
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
X-List-Received-Date: Thu, 21 Feb 2019 19:39:56 -0000


On 2/21/2019 11:55 AM, susan jasinski wrote:
> While talking with our layer today about the OpenBMC Apache license,
> we were not able to open the open-bmc license file in GitHub. Will
> someone please look at that file to see if there is a problem that
> needs to be fixed?

What license file? Which repo? openbmc/openbmc?
The openbmc/openbmc LICENSE points at poky/LICENSE.

$ ls -l  openbmc/LICENSE
lrwxrwxrwx 1 gmills gmills 12 Aug 23 14:29 openbmc/LICENSE -> poky/LICENSE

https://github.com/openbmc/openbmc/blob/master/poky/LICENSE

All the other repos have their own licenses, mostly Apache-2.0.

> Feel free to DM me if you don't find the same issue.

I would strongly discourage direct message on problems sent to the 
mailing list, then we have no idea if this problem has been resolved. :)

- Gunnar
