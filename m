Return-Path: <jrey@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44F3JV4btRzDqCH
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 06:11:06 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x26J4WgQ056131
 for <openbmc@lists.ozlabs.org>; Wed, 6 Mar 2019 14:11:03 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r2kcsa5h9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 14:11:03 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Wed, 6 Mar 2019 19:11:02 -0000
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 6 Mar 2019 19:10:59 -0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x26JAw0522872288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Mar 2019 19:10:58 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64A8E112074;
 Wed,  6 Mar 2019 19:10:58 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2427C11206D;
 Wed,  6 Mar 2019 19:10:58 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  6 Mar 2019 19:10:58 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 06 Mar 2019 13:18:38 -0600
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, Openbmc
 <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - Wednesday March 6
In-Reply-To: <469a36a4-df4f-87b4-1e36-cf50286abfc9@linux.vnet.ibm.com>
References: <72af3f948ad18b268c460f1c0a4d10f1@linux.vnet.ibm.com>
 <469a36a4-df4f-87b4-1e36-cf50286abfc9@linux.vnet.ibm.com>
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19030619-0060-0000-0000-00000317CF48
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010716; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01170557; UDB=6.00611779; IPR=6.00951196; 
 MB=3.00025861; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-06 19:11:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030619-0061-0000-0000-000048866697
Message-Id: <43795f1e94eff588d7bd8ac010610443@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-06_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903060131
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
X-List-Received-Date: Wed, 06 Mar 2019 19:11:07 -0000

On 2019-03-04 12:03, Ratan Gupta wrote:
> Hi Joseph,
> 
> Can we change the timing ? it is too late for india around(11:30 PM).

Note: I meant to send this email to the list, but sent it onto to Ratan. 
  Here it is for everyone:


Thanks for asking.  I've added this topic to the security work group 
meeting agenda:

         [Agenda item:] Interest in an additional security working group 
meeting?  9-10pm CDT is 8:30am India time.

Since you don't plan to be there I would like to get your input.  Here 
are my ideas:
- Is the time good?  Feel free to counter-propose.  Choose a date ... 
next Wednesday March 13 (3.14 for you, Pi day)?
- We can maybe use the existing Google hangout video call, or I can host 
a WebEx video meeting.
- It would be a security work group meeting, so topics are wide open.  
We could review old items or discuss new ones.  Agenda and minutes are 
linked from the wiki.
- I can offer to lead the BMC firewall or more general security 
discussion.

- Joseph

> Regards
> 
> Ratan Gupta
> 
> On 04/03/19 11:19 PM, Joseph Reynolds wrote:
>> This is a reminder of the OpenBMC Security Working Group meeting 
>> scheduled for this Wednesday March 6 at 10:00am PDT.
>> 
>> Current topics:
>> - development items with security impact
>> - default userids
>> 
>> Access, agenda, and notes are in the wiki:
>> https://github.com/openbmc/openbmc/wiki/Security-working-group
>> 
>> - Joseph
>> 
