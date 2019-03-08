Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Fvfz4SVjzDqC7
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 15:30:01 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x284OFiK126649
 for <openbmc@lists.ozlabs.org>; Thu, 7 Mar 2019 23:29:58 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r3e2tfxed-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Mar 2019 23:29:58 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Fri, 8 Mar 2019 04:29:56 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 8 Mar 2019 04:29:53 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x284ToO632178380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 8 Mar 2019 04:29:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01D90A4040;
 Fri,  8 Mar 2019 04:29:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75697A4057;
 Fri,  8 Mar 2019 04:29:48 +0000 (GMT)
Received: from [9.85.160.186] (unknown [9.85.160.186])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  8 Mar 2019 04:29:48 +0000 (GMT)
Subject: Re: Reg removal of un-used Set Password D-Bus method API
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, gkeishin@in.ibm.com
References: <045f6137-a7ff-81f1-8f16-bc97ce4c9dd1@linux.intel.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Fri, 8 Mar 2019 09:59:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <045f6137-a7ff-81f1-8f16-bc97ce4c9dd1@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19030804-0020-0000-0000-000003200CE9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030804-0021-0000-0000-00002172240C
Message-Id: <9f293ba3-ddf8-95ec-3a71-37d58bf6ed13@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-08_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=875 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903080030
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
X-List-Received-Date: Fri, 08 Mar 2019 04:30:04 -0000

George,

Seems we need to clean from the following place or some other private 
branch :)

https://github.com/openbmc/openbmc-test-automation/search?q=SetPassword&unscoped_q=SetPassword

Regards
Ratan Gupta
On 08/03/19 9:35 AM, Thomaiyar, Richard Marian wrote:
> All,
>
> As part of clean-up, planning to remove unused SetPassword D-Bus 
> method API exposed through password.interface.yaml. OpenBMC master 
> code doesn't rely on this API anymore, and uses pam_chauthtok() API to 
> update the password (for security purposes). Even 
> phosphor-user-manager don't expose SetPassword D-Bus method API. 
> Following 2 commits are in review which will remove the same permanently.
>
> Please let us know, if you have any concerns or require any further 
> clarifications.
>
> 1. 
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/18940/
>
> 2. 
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/18943/
>
> Regards,
>
> Richard
>
