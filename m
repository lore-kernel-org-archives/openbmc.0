Return-Path: <msbarth@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Fd500my0zDqDP
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 04:33:07 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x27HT9DT144749
 for <openbmc@lists.ozlabs.org>; Thu, 7 Mar 2019 12:33:05 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r36jpm8uy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Mar 2019 12:33:04 -0500
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Thu, 7 Mar 2019 17:33:03 -0000
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 7 Mar 2019 17:33:01 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x27HX0Jv24445082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Mar 2019 17:33:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C244BAC05B;
 Thu,  7 Mar 2019 17:33:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C8A1AC05E;
 Thu,  7 Mar 2019 17:33:00 +0000 (GMT)
Received: from [9.10.99.133] (unknown [9.10.99.133])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  7 Mar 2019 17:33:00 +0000 (GMT)
Subject: Re: PID control configuration usage
To: Ed Tanous <ed.tanous@intel.com>, openbmc@lists.ozlabs.org
References: <39398601-6181-ac24-991c-528e0b0f70f2@linux.ibm.com>
 <c304d042-3b25-6e80-7722-6fe3b3946182@intel.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Date: Thu, 7 Mar 2019 11:33:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <c304d042-3b25-6e80-7722-6fe3b3946182@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19030717-0064-0000-0000-000003B58DB0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010721; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01170996; UDB=6.00612048; IPR=6.00951639; 
 MB=3.00025880; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-07 17:33:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030717-0065-0000-0000-00003CA500EE
Message-Id: <a3b3fb1b-b20c-2979-3872-136b8f99fd07@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-07_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903070119
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
X-List-Received-Date: Thu, 07 Mar 2019 17:33:08 -0000



On 3/6/19 2:31 PM, Ed Tanous wrote:
> On 3/6/19 11:36 AM, Matthew Barth wrote:
>> I'm investigating the functionality and use of pid-control to what is
>> currently being used on IBM's witherspoon system.
> Sweeeeeet.
> 
>> Is there a PID control
>> configuration being used that's upstream? I am unable to find any
>> systems in the meta layers using pid-control that provides a direct
>> configuration example. It looks to be used in the Intel layer that pulls
>> a config together from entity-manager and presents it on dbus to
>> pid-control, but I dont follow how the entity-manager json transforms to
>> the consumable pid-control json.
> It doesn't.  When using the entity manager configs, the DBUS data
> structures are read directly by pid-control, and converted into the C
> data structures that the JSON would've been encoded to at build time.
> no json is created or destroyed.
> 
Thanks for clarifying that

>> Could someone point me to a functional
>> (possibly in-use) example or show the json config produced from
>> entity-manager?
> I thought the Quanta system used it, but I'm not seeing the JSON.
> Patrick checked in a basic example here:
> https://github.com/openbmc/phosphor-pid-control/blob/master/examples/fan-info.json
> But I'm guessing you already found that.
I did see that. I used that as my starting point, but its quite a simple 
config that I was interested in seeing a more complex example that's in use.

> 
> I'm not sure if it helps, but here's a dump of the entity-manager dbus
> interfaces, on a system with a dozen or so add in fru devices detected.
> Each fru device has its own thermal controllers installed and exposed to
> dbus.
> 
> https://pastebin.com/jaKw5TJa
Thanks, I'll dig thru this to see if I can associate the corresponding 
json entries I'd setup and give to swampd at startup.

Matt

> 
> -Ed
> 
