Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ghXC2MWGzDqS0
 for <openbmc@lists.ozlabs.org>; Sat, 13 Apr 2019 01:24:42 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3CF8wII082619
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 11:24:40 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rtu89ecqq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 11:24:39 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Fri, 12 Apr 2019 16:24:39 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 12 Apr 2019 16:24:36 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3CFOZr824576036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Apr 2019 15:24:35 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 371B2C6055;
 Fri, 12 Apr 2019 15:24:35 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C79B8C6059;
 Fri, 12 Apr 2019 15:24:34 +0000 (GMT)
Received: from [9.80.204.35] (unknown [9.80.204.35])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 12 Apr 2019 15:24:34 +0000 (GMT)
Subject: Re: USB Gadget Vendor ID
To: Adriana Kobylak <anoo@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <213010e1dd547165f8f56ee672c832fa@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Fri, 12 Apr 2019 10:24:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <213010e1dd547165f8f56ee672c832fa@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19041215-0012-0000-0000-0000172630C8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010914; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01188060; UDB=6.00622365; IPR=6.00968828; 
 MB=3.00026410; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-12 15:24:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041215-0013-0000-0000-000056D83B2F
Message-Id: <fdb92e78-6cdf-04e3-9b4f-6ca3d36b73e8@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-12_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=878 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904120101
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
X-List-Received-Date: Fri, 12 Apr 2019 15:24:43 -0000


On 4/12/19 10:17 AM, Adriana Kobylak wrote:
> Hi Eddie,
>
> I have a script to initialize the USB gadget for Virtual Media and 
> there was a comment that the Vendor ID should be provided by the Linux 
> Foundation - 
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/17494 .
>
> In your ikvm script you use a Vendor ID with the comment "Linux 
> Foundation" - 
> https://github.com/openbmc/obmc-ikvm/blob/fb6a8e1e727a8ece5eb0350d3962dd3056a6f608/create_usbhid.sh#L18
>
> Is this an ID that came from the LF, and if so could I use it in my 
> script?


Hi,

Since OpenBMC is a LF project, I just used their vendor ID... and I just 
invented a serial number. This might not be the proper way to do it... 
Since the devices are virtual, I'm not sure anyone will care though?


>
> As a side question, were there any discussions about the serial number 
> value in the ikvm script? I have a similar hard-coded value for the 
> virtual media one but there were questions in the review about how 
> useful could it be having a non-generated value and to have it removed 
> instead.


I think there were similar comments about the serial number but in the 
end it was decided to worry about it later I think.

Thanks, Eddie
