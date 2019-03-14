Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44L3lg3rygzDqPb
 for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2019 09:48:31 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2EMhncp096319
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 18:48:27 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r7xj7kqwt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 18:48:26 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 14 Mar 2019 22:48:24 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 14 Mar 2019 22:48:20 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2EMmJuV30867512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 14 Mar 2019 22:48:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D28BCAE051;
 Thu, 14 Mar 2019 22:48:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6ED69AE045;
 Thu, 14 Mar 2019 22:48:17 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.249.172])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Mar 2019 22:48:16 +0000 (GMT)
Subject: Re: [OCP] Open Source Firmware Meetup@OCP Global Summit
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "OCP-Security@OCP-All.groups.io" <OCP-Security@OCP-All.groups.io>,
 "OpenRMC@OCP-All.groups.io" <OpenRMC@OCP-All.groups.io>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <9D7F7790-90A4-4312-B714-F948FD6251F7@fb.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Thu, 14 Mar 2019 15:48:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <9D7F7790-90A4-4312-B714-F948FD6251F7@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19031422-0020-0000-0000-000003237125
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19031422-0021-0000-0000-0000217577A5
Message-Id: <54b69e7f-5dbb-4e15-b295-3166c0d1f992@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-14_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903140153
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
X-List-Received-Date: Thu, 14 Mar 2019 22:48:32 -0000

On 11/03/19 10:37 PM, Sai Dasari wrote:
> Team,
> 
> For those of you planning to attend OCP Global summit **this** week @ 
> 2019 OCP Global Summit 
> <https://www.opencompute.org/summit/global-summit>, please check out the 
> post about the meetup @
> 
> https://www.opencompute.org/news/open-source-firmware-meetup-at-the-2019-ocp-global-summit-call-for-participation.
> 
> Community members came up with few topic streams for this meetup 
> opportunity are captured @ 
> https://docs.google.com/spreadsheets/d/1cKAYFP2fEhgBoEBjGrCrOAq6-01nyX53M9rrLaJxlk4/edit#gid=0 
> 
> 
> Will look forward to meeting you at this meetup to accelerate efforts in 
> open source firmware. Please reach out to me and/or project leads for 
> more info.
> 
> Thanks,
> 
> Sai.

We were planning on talking PLDM/MCTP at 11 on 15th March, at the Open 
Source Firmware Meetup. Please join if you're interested!

Thanks,
Deepak
