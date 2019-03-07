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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FZ5x3bYLzDqDT
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 02:18:44 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x27ExLkI080796
 for <openbmc@lists.ozlabs.org>; Thu, 7 Mar 2019 10:18:42 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2r34ddwhtk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Mar 2019 10:18:41 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Thu, 7 Mar 2019 15:18:40 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 7 Mar 2019 15:18:38 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x27FIbn759703344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 7 Mar 2019 15:18:37 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29C1142047;
 Thu,  7 Mar 2019 15:18:37 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA5F74204F;
 Thu,  7 Mar 2019 15:18:36 +0000 (GMT)
Received: from [9.202.13.25] (unknown [9.202.13.25])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  7 Mar 2019 15:18:36 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday March 6
To: Joseph Reynolds <jrey@linux.ibm.com>, Openbmc <openbmc@lists.ozlabs.org>
References: <72af3f948ad18b268c460f1c0a4d10f1@linux.vnet.ibm.com>
 <469a36a4-df4f-87b4-1e36-cf50286abfc9@linux.vnet.ibm.com>
 <43795f1e94eff588d7bd8ac010610443@linux.vnet.ibm.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Thu, 7 Mar 2019 20:48:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <43795f1e94eff588d7bd8ac010610443@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19030715-0028-0000-0000-000003513D65
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030715-0029-0000-0000-0000240FAFBA
Message-Id: <bd89b905-c188-624f-96b1-44761ad9fe1b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-07_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903070103
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
X-List-Received-Date: Thu, 07 Mar 2019 15:18:46 -0000

Hi Joseph,

We shouldn't add overheads with multiple meetings. My request was to 
prepone the timings so that India folks(IBM, Intel etc) can also join 
and share inputs directly in the main community call. Would appreciate 
if the timings can be adjusted.

Regards
Ratan Gupta


On 07/03/19 12:48 AM, Joseph Reynolds wrote:
> On 2019-03-04 12:03, Ratan Gupta wrote:
>> Hi Joseph,
>>
>> Can we change the timing ? it is too late for india around(11:30 PM).
>
> Note: I meant to send this email to the list, but sent it onto to 
> Ratan.  Here it is for everyone:
>
>
> Thanks for asking.  I've added this topic to the security work group 
> meeting agenda:
>
>         [Agenda item:] Interest in an additional security working 
> group meeting?  9-10pm CDT is 8:30am India time.
>
> Since you don't plan to be there I would like to get your input. Here 
> are my ideas:
> - Is the time good?  Feel free to counter-propose.  Choose a date ... 
> next Wednesday March 13 (3.14 for you, Pi day)?
> - We can maybe use the existing Google hangout video call, or I can 
> host a WebEx video meeting.
> - It would be a security work group meeting, so topics are wide open.  
> We could review old items or discuss new ones.  Agenda and minutes are 
> linked from the wiki.
> - I can offer to lead the BMC firewall or more general security 
> discussion.
>
> - Joseph
>
>> Regards
>>
>> Ratan Gupta
>>
>> On 04/03/19 11:19 PM, Joseph Reynolds wrote:
>>> This is a reminder of the OpenBMC Security Working Group meeting 
>>> scheduled for this Wednesday March 6 at 10:00am PDT.
>>>
>>> Current topics:
>>> - development items with security impact
>>> - default userids
>>>
>>> Access, agenda, and notes are in the wiki:
>>> https://github.com/openbmc/openbmc/wiki/Security-working-group
>>>
>>> - Joseph
>>>
