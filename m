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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kR8y3PFGzDrNX
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 07:32:01 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9TKO7qU009779
 for <openbmc@lists.ozlabs.org>; Mon, 29 Oct 2018 16:31:59 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ne8e0t6sx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 29 Oct 2018 16:31:58 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Mon, 29 Oct 2018 16:31:58 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 29 Oct 2018 16:31:56 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w9TKVtqS20250670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 29 Oct 2018 20:31:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FC1F112062;
 Mon, 29 Oct 2018 20:31:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 092C011206B;
 Mon, 29 Oct 2018 20:31:55 +0000 (GMT)
Received: from [9.10.223.0] (unknown [9.10.223.0])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 29 Oct 2018 20:31:54 +0000 (GMT)
Subject: Re: Should we tag master?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <b955c4bf-7605-945d-c7dd-ac3669809cee@linux.vnet.ibm.com>
 <CAO=notwRaJcdiD8KnbB_pe3k=v6BFZXGnrEcxBH-29LZ=pGL6A@mail.gmail.com>
 <674AECB5-F797-477D-B4CA-A7A257310CE8@fuzziesquirrel.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Date: Mon, 29 Oct 2018 15:31:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <674AECB5-F797-477D-B4CA-A7A257310CE8@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18102920-0052-0000-0000-0000034BD425
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009949; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01109809; UDB=6.00575001; IPR=6.00889901; 
 MB=3.00023955; MTD=3.00000008; XFM=3.00000015; UTC=2018-10-29 20:31:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18102920-0053-0000-0000-00005E952FF4
Message-Id: <44520f40-3328-ec18-5838-be3bac2fec25@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-29_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=834 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810290184
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
X-List-Received-Date: Mon, 29 Oct 2018 20:32:03 -0000


On 10/29/2018 2:27 PM, Brad Bishop wrote:
> This was discussed on the community call today.  I’ll start limiting
> meta-phosphor content to fixes only on 11/11 and then I’ll do a v2.4 tag
> on 11/16.
>

Sounds great. Thanks Brad!
