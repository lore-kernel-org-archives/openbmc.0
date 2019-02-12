Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43z7Wx2zR9zDqPm
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 14:32:44 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1C3SmoM065494
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 22:32:42 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qkk5368g5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 22:32:42 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Tue, 12 Feb 2019 03:32:40 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 12 Feb 2019 03:32:39 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1C3Wc1o51839074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 03:32:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF60352057
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 03:32:38 +0000 (GMT)
Received: from [9.85.191.175] (unknown [9.85.191.175])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id E88D95204F
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 03:32:37 +0000 (GMT)
Subject: Re: Secure boot for BMC
To: openbmc@lists.ozlabs.org
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
 <1549861046.1162750.1655235472.36317B95@webmail.messagingengine.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Tue, 12 Feb 2019 09:02:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549861046.1162750.1655235472.36317B95@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19021203-4275-0000-0000-0000030E5BDE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021203-4276-0000-0000-0000381C6F51
Message-Id: <b0b40348-dbc2-f90d-d2f0-83bc3bbfd379@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-12_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=626 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902120024
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
X-List-Received-Date: Tue, 12 Feb 2019 03:32:46 -0000

I am also interested in secure boot discussion for BMC.

Ratan

On 11/02/19 10:27 AM, Andrew Jeffery wrote:
> On Wed, 6 Feb 2019, at 00:44, Brad Bishop wrote:
>> Hi everyone
>>
>> Does anyone have plans to provide a secure BMC boot implementation to
>> OpenBMC in the 2.7 or 2.8 timeframe?  Just trying to get a feel for who
>> all wants to collaborate on this before I submit a design template.
>>
>> thx - brad
> I'm interested in secureboot discussions.
>
> Andrew
>
