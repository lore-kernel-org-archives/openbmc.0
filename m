Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404YTD5B7vzF1Sy
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 22:18:08 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2JBEl1n012701
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 07:18:06 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2gt91gygns-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 07:18:05 -0400
Received: from localhost
 by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Mon, 19 Mar 2018 11:18:04 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 19 Mar 2018 11:18:03 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2JBI2eC58130470; Mon, 19 Mar 2018 11:18:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FCC011C04C;
 Mon, 19 Mar 2018 11:10:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65D1C11C054;
 Mon, 19 Mar 2018 11:10:34 +0000 (GMT)
Received: from [9.193.103.229] (unknown [9.193.103.229])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 19 Mar 2018 11:10:34 +0000 (GMT)
Subject: Re: IPMI SOL performance
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
To: Jeremy Kerr <jk@ozlabs.org>, Bradley W Bishop <bradleyb@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
Date: Mon, 19 Mar 2018 16:47:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18031911-0040-0000-0000-00000422CA82
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031911-0041-0000-0000-00002625DF19
Message-Id: <eb3ad4a5-d261-adaa-1782-b7cf77fc7267@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-19_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803190134
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2018 11:18:09 -0000


   Related issue -  https://github.com/openbmc/openbmc/issues/2958

On Monday 19 March 2018 04:43 PM, Tom Joseph wrote:
> Hello,
>
> I wanted to discuss about an issue related to IPMI SOL. Petitboot has 
> a menu to select the boot option, it has a timeout after which the 
> default boot option is selected and boot continues.The observation is 
> that when verbose debug traces are enabled in the hostboot, by the 
> time petitboot options are printed on the SOL console the menu timeout 
> expires and the user is not able to change the boot option.
>
> The same issue is not hit by the ssh console on port 2200 and does not 
> miss the timeout of the petitboot menu option.
>
> IPMI uses UDP protocol and the maximum size of the  SOL payload per 
> packet according to the specification is 255 bytes. Also the ack for 
> each of the IPMI packet requires a command lookup
> and execution. Compared with IPMI SOL, ssh supports 64kb payloads and 
> ack does not need an application lookup, so the round-trip timing is 
> faster. IPMI specification for SOL is written with UART speed as 
> reference, but the VUART pushes the data at a much faster rate.
>
> One suggestion that I came across support an OEM payload size for SOL, 
> which is higher than 255 bytes, to get a better throughput. Please do 
> share other ideas to tackle this problem and improve performance.
>
> Regards,
> Tom
>
