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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kyL42RMfzDqLR
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 18:56:59 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0N7snwJ102762
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 02:56:57 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q6kje246k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 02:56:56 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Wed, 23 Jan 2019 07:56:52 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 23 Jan 2019 07:56:50 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0N7unKZ3015154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Jan 2019 07:56:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 639AD42041;
 Wed, 23 Jan 2019 07:56:49 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD7DA42045;
 Wed, 23 Jan 2019 07:56:48 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.254.85])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Jan 2019 07:56:48 +0000 (GMT)
Subject: Re: PLDM design proposal
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
To: Ben Wei <benwei@fb.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <MWHPR15MB1327A59DC0012C831B79E817A3870@MWHPR15MB1327.namprd15.prod.outlook.com>
 <6fea6e16-2156-7bb7-5f6c-ca7847d730b2@linux.vnet.ibm.com>
 <MWHPR15MB13272EE8CF59309817820E77A3830@MWHPR15MB1327.namprd15.prod.outlook.com>
 <9f794735-1087-c132-5ca6-50e44190aa00@linux.vnet.ibm.com>
Date: Wed, 23 Jan 2019 13:26:47 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <9f794735-1087-c132-5ca6-50e44190aa00@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19012307-0012-0000-0000-000002EBBC62
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012307-0013-0000-0000-00002122EA71
Message-Id: <d3f7f8e4-0730-57cc-1a23-01e353be4db3@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-23_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=794 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901230061
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
X-List-Received-Date: Wed, 23 Jan 2019 07:57:00 -0000

On 21/01/19 1:38 PM, Deepak Kodihalli wrote:
> On 18/01/19 4:29 AM, Ben Wei wrote:
>>> Please do let me know if you have additional questions. I plan to 
>>> incorporate your feedback, and I'll most likely post the next draft 
>>> on Gerrit.
>>
>> Great! Looking forward to it.

I've added this design to Gerrit: 
https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/17592/. All of the 
feedback that I've received on the mailing list has been addressed.

Ben, regarding the concurrency aspects of the PLDM requester/responder, 
I've recommended using ASIO (sdbuplus-asio, which is based on Boost 
ASIO, lets us make asynchronous D-Bus calls) as an alternate to 
multi-theading.

Thanks,
Deepak
