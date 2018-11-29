Return-Path: <jrey@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 435XnM5ttSzDrQp
 for <openbmc@lists.ozlabs.org>; Fri, 30 Nov 2018 09:51:18 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wATMhgvO073360
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 17:51:17 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2p2q5amywr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 17:51:16 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.vnet.ibm.com>;
 Thu, 29 Nov 2018 22:51:15 -0000
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 29 Nov 2018 22:51:13 -0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wATMpCsA17694798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 29 Nov 2018 22:51:12 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98AAA112063;
 Thu, 29 Nov 2018 22:51:12 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BB35112066;
 Thu, 29 Nov 2018 22:51:12 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 29 Nov 2018 22:51:12 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 29 Nov 2018 16:54:48 -0600
From: jrey <jrey@linux.vnet.ibm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Understand OpenBMC Event logging mechanism for beginner
In-Reply-To: <cd424085-d81d-bde4-bc94-39d7fa9bcfa3@linux.vnet.ibm.com>
References: <AM6PR02MB4392A3F66A51CFB0AAFEE86C92D10@AM6PR02MB4392.eurprd02.prod.outlook.com>
 <cd424085-d81d-bde4-bc94-39d7fa9bcfa3@linux.vnet.ibm.com>
X-Sender: jrey@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18112922-0060-0000-0000-000002DBC0FA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010145; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01124653; UDB=6.00583933; IPR=6.00904781; 
 MB=3.00024390; MTD=3.00000008; XFM=3.00000015; UTC=2018-11-29 22:51:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18112922-0061-0000-0000-0000475DEB19
Message-Id: <9feec1c27297d6091f1fa5e3af1c6805@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-29_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1811290191
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
X-List-Received-Date: Thu, 29 Nov 2018 22:51:20 -0000

On 2018-11-29 02:22, Deepak Kodihalli wrote:
> On 28/11/18 5:18 PM, A, Maheswari wrote:
>> Hi,
>> 
>> I found some OpenBMC document to understand LED Control architecture.
>> 
>> Document is very useful for beginner.
>> 
>> But There is no document to understand workflow of OpenBMC event 
>> management for beginner.
> 
> 
> Agree. I volunteer to write a document related to phosphor-logging.

I am interested in reviewing your doc.

I interpret Maheswari's original question as:
1. how to create a new event type,
2. how to generate an event (such as from a daemon monitoring a gpio 
pin, or interactively from the command line or a test program),
3. how to monitor for event and write SELs, and
4. how to read SELs from the log.

That is, generating the SEL is the desired result, but I need to 
understand the flow from end-to-end.

I assume there is code that already does each of these things.  Perhaps 
your doc could walk us through it and explain each piece?

...snip...

>> 
>> Please clarify which recipes are needed to log events in BMC.
>> 
>> Please explain some basic understanding to log test event.
>> 
>> How do verify logged events .
> 
> 
> If you're just interested in IPMI SELs, you should look at those
> reviews I posted above. Were you looking at something else though as
> the external interface - such as Redfish?
> 
>> Thanks
>> 
>> Maheswari A
>> 
> 
> Regards,
> Deepak

- Joseph
