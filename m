Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42X1D73FLgzF13h
 for <openbmc@lists.ozlabs.org>; Sat, 13 Oct 2018 08:28:39 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9CLNnie103049
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 17:28:36 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2n31w7utu2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 17:28:36 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Fri, 12 Oct 2018 15:28:35 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 12 Oct 2018 15:28:33 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w9CLSWJ525559222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Oct 2018 14:28:32 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD1F7C6057;
 Fri, 12 Oct 2018 15:28:32 -0600 (MDT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B86EC6055;
 Fri, 12 Oct 2018 15:28:32 -0600 (MDT)
Received: from [9.10.99.83] (unknown [9.10.99.83])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 12 Oct 2018 15:28:32 -0600 (MDT)
Subject: Re: Notion of Flakiness in Sensor Readings
To: Patrick Venture <venture@google.com>,
 James Feist <james.feist@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <CAO=notz_KizBdONsKjtQ6U05r4hWQOuxa_cx9Cshps7V8=PRbw@mail.gmail.com>
 <3fc8bbb4-2db9-6df0-4fc3-1addf4b94ac3@linux.intel.com>
 <CAO=notwOiB-v5LxZ=OagkGTzhM8dnt5kogO=eaTGEKGp7si14Q@mail.gmail.com>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Fri, 12 Oct 2018 16:28:32 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO=notwOiB-v5LxZ=OagkGTzhM8dnt5kogO=eaTGEKGp7si14Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18101221-0036-0000-0000-00000A4981D2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009868; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01101751; UDB=6.00570140; IPR=6.00881796; 
 MB=3.00023732; MTD=3.00000008; XFM=3.00000015; UTC=2018-10-12 21:28:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18101221-0037-0000-0000-00004943A3F7
Message-Id: <e6652bad-d524-3912-6be2-9dc2bc9d4669@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-12_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810120214
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
X-List-Received-Date: Fri, 12 Oct 2018 21:28:40 -0000



On 10/12/2018 4:23 PM, Patrick Venture wrote:
> On Fri, Oct 12, 2018 at 2:09 PM James Feist <james.feist@linux.intel.com> wrote:
>> On 10/12/2018 01:53 PM, Patrick Venture wrote:
>>> Currently, there are a few approaches in phosphor-hwmon on how to
>>> handle sensors being present sometimes, or flaky on reads.  We've
>>> talked in the past about how to handle a read failure that should be
>>> ignored.  A real failure that is flaky or temporary.
>>>
>>> I was thinking of just adding a property to the Sensor.Value interface
>>> to report information.  Basically, someone reading the value needs to
>>> know if it's valid.  The idea of a range check for validity doesn't
>>> work as cleanly for this specific purpose, in my opinion.  The min/max
>>> can be used cleanly to determine the linearization though!
>>>
>>> I was thinking perhaps a boolean, that you can check to see if the
>>> value should be used or trusted.  Then, I thought, perhaps, a enum
>>> with a series of states, starting with the states of "Valid',
>>> "Invalid."  Not being able to think of a third state, I fell back onto
>>> a boolean.

If the hwmon driver for your device provides a _fault attribute, and 
that gets set, the code is already
set up to create an OperationalStatus interface on that sensor instance 
and set the Functional
property to false.

>> For Valid / Invalid we've produced nan on D-Bus to know that the sensor
>> is in an invalid state (like power off for tach values). Although I'm
>> not sure how this would be produced using the int64 interface, for the
>> double std::nan will go over d-bus correctly.
> So if i just wait until we're using double, the issue basically
> resolves itself? :D :D
>
>>> Thoughts?
>>>
>>> Patrick
>>>
