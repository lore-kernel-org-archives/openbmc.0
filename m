Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DNRm69pbzDqpy
 for <openbmc@lists.ozlabs.org>; Mon, 17 Sep 2018 20:59:32 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8HAwj4g036773
 for <openbmc@lists.ozlabs.org>; Mon, 17 Sep 2018 06:59:29 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2mj7pkr63v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Sep 2018 06:59:29 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Mon, 17 Sep 2018 11:59:24 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 17 Sep 2018 11:59:23 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w8HAxMag61931726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 17 Sep 2018 10:59:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 571F511C052;
 Mon, 17 Sep 2018 13:59:08 +0100 (BST)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB9EB11C04C;
 Mon, 17 Sep 2018 13:59:07 +0100 (BST)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.202.110])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Sep 2018 13:59:07 +0100 (BST)
Subject: Re: D-Bus interface to update multiple properties in one shot
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <c917aa9a-98ff-d9b7-be60-6000b439742e@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E82169934583C68C@ORSMSX114.amr.corp.intel.com>
 <83816db6-4fd7-688b-48e9-75a96f76ef24@linux.vnet.ibm.com>
Date: Mon, 17 Sep 2018 16:29:21 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <83816db6-4fd7-688b-48e9-75a96f76ef24@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18091710-4275-0000-0000-000002BB4772
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18091710-4276-0000-0000-000037C48CC2
Message-Id: <3e391514-40ae-9343-4ad7-963e1e447312@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1809170116
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
X-List-Received-Date: Mon, 17 Sep 2018 10:59:33 -0000

On 10/09/18 12:08 PM, Deepak Kodihalli wrote:
> On 07/09/18 8:14 PM, Tanous, Ed wrote:
>>>
>>> A proposal we discussed in a meet recently is to implement a new
>>> xyz.openbmc_project.Object.Properties D-Bus interface with a method
>>> called 'Update', which accepts a dictionary of property-value pairs.
>>
>> I'm not really following what problem this is trying to solve.  Does 
>> the timer in networkd not work as designed?  Are we trying to remove 
>> it?  In which use cases are we seeing performance problems with 
>> multiple set calls?  Have we measured these performance impacts?
> 
> The problem I'm trying to solve is with D-Bus apps (currently 
> implementing org.freedesktop.DBus.Properties) that want to take a 
> specific action after all or a subset of a D-Bus properties that they 
> expose have been set. The typical action in these cases is restarting a 
> service (because say on each set, you update a config file). It's the 
> restart that's causing performance problems - because there could be too 
> many of them, if you were updating a lot of properties. I don't think 
> the timer is intuitive to a user of the API, because in scenarios where 
> only a subset of the properties are updated, the additional wait time to 
> get served is unexpected to the user of the API.
> 
>> What worries me about the proposed interface is consistency.  Will we 
>> be adding the xyz.openbmc_project.Object.Properties interface as a 
>> specification to certain paths in phosphor? all paths? All object 
>> manager paths?
> 
> Specific (not object manager) paths. For eg I don't think we'd need to 
> add this to objects implementing inventory interfaces (those are a bunch 
> of properties as well). I view implementing this interface as an 
> (optional) improvement over org.freedesktop.DBus.Properties, in some 
> cases, but this is not a replacement for the 
> org.freedesktop.DBus.Properties interface. So objects implementing this 
> proposed interface must implement org.freedesktop.DBus.Properties as well.
> 
>> How will one know which paths require use of the 
>> org.freedesktop.DBus.Properties interface, and which can use the 
>> interface you've proposed?  Yes, we could do a mapper call to find 
>> out, but I'm going to negate any performance improvement we've gained.
> 
> This can be described in the documentation of the D-Bus API. For eg, how 
> does one know they have to implement org.freedesktop.DBus.ObjectManager 
> (this is not a mandatory interface to implement)? This is typically 
> documented in the D-Bus API.
> 
>> When calling the update method, if one of the property update fails, 
>> what then?  Does the property update get partially applied, does it 
>> roll back to the old values?  I don't think there are any good 
>> catchall answers here.
> 
> Good point. I think the caller must be able to resort to using the 
> org.freedesktop.DBus.Properties interface. The update method of the 
> proposed interface can fail on the first set that fails, and return back 
> the properties that were successfully updated.
> 
> Thanks,
> Deepak
> 
>> This idea intrigues me, but I think in many of these cases, 
>> consistency is more important than performance.  If there's a way to 
>> keep consistency with the proposed interface _and_ get performance, 
>> then I think that this could be workable, I'm just not sure how to 
>> accomplish both.
>>
>> -Ed
>>
> 

I've put this for review on Gerrit - 
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/12861/.

Thanks,
Deepak
