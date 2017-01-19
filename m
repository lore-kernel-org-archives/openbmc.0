Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3tlg3YlpzDqL4
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 17:11:59 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0J68onb124972
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 01:11:56 -0500
Received: from e28smtp06.in.ibm.com (e28smtp06.in.ibm.com [125.16.236.6])
 by mx0b-001b2d01.pphosted.com with ESMTP id 282qaqh6a7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 01:11:56 -0500
Received: from localhost
 by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 19 Jan 2017 11:41:52 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
 by e28smtp06.in.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 19 Jan 2017 11:41:50 +0530
Received: from d28relay08.in.ibm.com (d28relay08.in.ibm.com [9.184.220.159])
 by d28dlp01.in.ibm.com (Postfix) with ESMTP id 403D9E005B
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 11:42:58 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
 by d28relay08.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0J6AwPc27132048
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 11:40:58 +0530
Received: from d28av04.in.ibm.com (localhost [127.0.0.1])
 by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0J6BmhP011318
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 11:41:48 +0530
Received: from [9.199.66.245] ([9.199.66.245])
 by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0J6Bmse011315; Thu, 19 Jan 2017 11:41:48 +0530
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
To: Mine <mine260309@gmail.com>, Patrick Williams <patrick@stwcx.xyz>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <20170116194447.d3yzsldsu3qsl5sz@asimov>
 <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
 <20170118144408.GA5120@heinlein.lan>
 <CAARXrtmRRC0ix9cXbe=PKdmw_cs=Eend52A1NKy-9WGa0hJwRA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Thu, 19 Jan 2017 11:41:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAARXrtmRRC0ix9cXbe=PKdmw_cs=Eend52A1NKy-9WGa0hJwRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011906-0020-0000-0000-000000A89EC4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011906-0021-0000-0000-000002635A2F
Message-Id: <38683dc2-7d4f-11eb-589c-c87784253610@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-18_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701190083
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2017 06:12:00 -0000

hey Lei,

I will add some here. Hopefully that helps clarify.

On 01/19/2017 09:18 AM, Mine wrote:
> On Wed, Jan 18, 2017 at 10:44 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>> On Tue, Jan 17, 2017 at 03:51:39PM +0800, Mine wrote:
>>> On Tue, Jan 17, 2017 at 3:44 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>>>> On Fri, Jan 13, 2017 at 03:42:50PM +0800, Mine wrote:
>>> I should be meant to create two "instances" on the bus, eventually it looks
>>> something like:
>>> ```
>>> xyz.openbmc_project.Time.Manager
>>> ..................................
>>>      /xyz/openbmc_project/time/host_epoch
>>>          org.freedesktop.DBus.Peer
>>>          org.freedesktop.DBus.Introspectable
>>>          org.freedesktop.DBus.Properties
>>>          xyz.openbmc_project.Time.EpochTime
>>>      /xyz/openbmc_project/time/bmc_epoch
>>>          org.freedesktop.DBus.Peer
>>>          org.freedesktop.DBus.Introspectable
>>>          org.freedesktop.DBus.Properties
>>>          xyz.openbmc_project.Time.EpochTime
>> There isn't a reason to name the object path "epoch".  /time/bmc and
>> /time/host0 is probably more appropriate.
> OK.
>
>>>>> And there will be no “curr_time_mode/owner” or “requested_time_mode/owner”
>>>>> properties on DBUS.
>>>> So these are only stored in phosphor-settingsd now or are they also used
>>>> internally for decisions?  I believe the previous implementation had
>>>> them exposed more for debug purposes.  Are you going to add them to the
>>>> journal at least?
>>> Yes, the time_mode and time_owner are still stored in
>>> phosphor-settingsd, and they
>>> are used internally by phosphor-time-manager, which will register
>>> callback for the
>>> settings' change and handled accordingly.
>>> The difference from the previous implementation is that we do not expose these
>>> settings in time-manager's DBus now.
>> There are two aspects for consideration here:
>>
>>      1. The current time manager defers changing the host policies until
>>         the next boot.  We need to continue this behavior.
>>
>>      2. If the process restarts we need it to go back into the "current
>>         state" and not the "requested state".  How do we make this
>>         happen?  The current implementation might also have a flaw here
>>         so maybe we log it as an issue for follow up.
>>
> This is the part I did not understand well on the previous "requested"
> and "current" mode.
> My consideration/question (for previous code) is:
> It has two settings of time mode/owner, one in settingsd, the other in
> timemanager, then
> which service is *really* responsible for the setting?

'Settingsd' provides the system level settings that are settable by 
users at any point of time. This
should be treated as "Customer request". This does not mean that 
whatever that is written to settings
is readily acceptable by the consumers. Putting a value in 'settings' 
indicates that 'I want this
value to be used whenever the system condition allows it'. If some 
settings are related to changing
the IP address, then fair enough, we don't really want to defer applying 
that until some system
condition is reached. However, the time owner is something that can only 
be set when the host is OFF
and this is done to make sure that we start clean and not get into 
managing on the fly offsets.

So the values that get updated in 'settings' are *Totally* controlled by 
settingsd and no other daemon updates the values.
> E.g. if current time owner is BMC, and mode is NTP,. when settingsd
> set time owner to HOST:
> 1. timemanager save the owner to requested_owner;
> 2. If host is off, it defers the change, then:

That is not true. Its the other way.
>     * In settingsd, owner is HOST, mode is NTP;
>     * In timemanager, current owner is BMC, requested owner is HOST, mode is NTP
>     It's kindly of complicated and confusing;

When the Host is OFF, time-manager consumes all the values readily as 
and when the updates are made to
settings since we are still at standby and we are safe.
> 3. If host is on, it sets the owner to HOST, and change the mode to
> MANUAL (it has specific
> comments to indicates that HOST and NTP are exclusive), then:
>     * In settingsd, owner is HOST, mode is MANUAL;
>     * In timemanager, current owner is HOST, requested owner is HOST,
> mode is MANUAL
>     So changing settingsd time owner also affects settingsd mode.
>     It looks as if timemanager is responsible for the setting.

I am sorry if you feel that this logic is complicated. But let me try to 
help you on this. It just
follows one thumb rule and that is:

* When timemanager receives the signal from settingsd telling that some 
of the settings have changed,
  then it will *

1/. Apply the changes into timemanager internal config immediately if 
the HOST is OFF ( actually if
  pgood is off )

2/. If PGOOD is [On], then the changes are *not* applied into current_* 
and are kept as *requested*.
When the Pgood turns back to [Off] state again ( because time manager 
receives a signal telling so ),
that the updates in *request* are consumed into *current* and the 
necessary house keeping is done.
> I feel this piece of logic is too complicated, it's better that we
> simplifies it:
> 1. Enforce that settingsd is the owner of settings, timemanager shall not modify
>      settingsd's settings, but only register callbacks on changes.

This is exactly what time manager is doing today. I am not sure why you 
are thinking that time manager
is updating the settings. Settingsd is in *complete* control of owning 
'settings' and time manager
just receives the signal broadcasted by 'settings' telling about a 
change in the property.

The curr_time_mode and requested_time_mode are totally *private* to time 
manager and they are there just to cater to the usecase that I mentioned 
above. Those *private* settings are *not* settable by an outside 
application. They are read-only dbus properties just to help in debug.
> 2. Combine the time mode/owner into:
>     * BMC_NTP  ==> Both Bmc/Host Epoch return the same time as BMC's NTP time;
>                                Setting epoch is not allowed
>     * BMC_MANUAL ==> Both Bmc/Host Epoch return the same BMC time;
>                                      Setting BMC epoch is allowed,
> setting HOST epoch is not allowed
>     * HOST_MANUAL ==> Both Bmc/Host Epoch return the same HOST time;
>                                        Settings BMC epoch is not
> allowed, settings HOST epoch is allowed
>                                        (It looks like BMC_MANUAL and
> HOST_MANUAL can be merged as MANUAL?
>                                         since they are actually the same)
>     * SPLIT_NTP  ==> Bmc and Host Epoch are separated;
>                                  BMC uses NTP time, and setting is not allowed;
>                                  Host epoch can be get and set;
>     * SPLIT_MANUAL ==> Bmc and Host Epoch are separated
>                                        Both can be get and set.
>
> What's your opinion?

I hope that helped ?


>
>>> What do you mean by "add them to the journal"?
>> Use phosphor-logging.
> Yes, the code uses phosphor-logging to send log to journal.
>
>> --
>> Patrick Williams
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
