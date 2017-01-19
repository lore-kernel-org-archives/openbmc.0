Return-Path: <mine260309@gmail.com>
Received: from mail-qt0-x22d.google.com (mail-qt0-x22d.google.com
 [IPv6:2607:f8b0:400d:c0d::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3zYQ6LNszDqGq
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 20:48:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rUwIJmkP"; 
 dkim-atps=neutral
Received: by mail-qt0-x22d.google.com with SMTP id v23so58985263qtb.0
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 01:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d8HwtWlL6An0aoJq5/gLeRSxvr6g4FGdODuV+2omx44=;
 b=rUwIJmkP2LUd6zvcmOMR4vAfCT2X7vbnFsBlHSwVCNju5WN5YECDZKoaP0JEscsqzP
 ycE/b2CdFFtEfxF2YWTUl4PONfZwdUbTywx6Vq/qoAHLkepCXM/6MTx8paOeWqx5nusc
 BxHw85lblFKoSnHQlyNDqo9uyCtFDF44uZmjCx1fx3noJdIyioiu80FsyCPaiz2B2pIL
 SScgFVfX9ojUEoPyB1dUsCyL78dEG+7XdHduBiZDF9oWnS14ybPtHUm5DpdUS2r6xdKs
 pH2yw3Vy3AzWBtukG4CKtqN5+bSbPfMgGorQ+Jv3tnE1lbKHW4L02r4tlpR1kk0rO5D6
 Mx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d8HwtWlL6An0aoJq5/gLeRSxvr6g4FGdODuV+2omx44=;
 b=RYgCuW9ujA0rxpFG8OIeYgjXrjXsAKBBM5KMkyaTgDeTW5HbCN9baZ3Oc/Xk4/GeSo
 SUDsAG8Rm3/Q2I29bZotZppZZ993nj7NwmQoqpbaCI6giUAYYVosDHcd97mhCTlTQouK
 Um/nKil0Zo8BhxEvxCmcvMe5mfi7Q3sK5Hc6A/v8bpvR7ZqCNg+oJHHuveMP20iErMWV
 8nBTMmkkKoXx1m6gxT/MP/m8advrHqZQo4aSThGUEC3HhbbECSJ2+7qfQ61cL26FvpPa
 lQLHzCUm0Hc+I8IPDDighoBO1awkauDnwnv/WG8BeND36cTdX+YHjlut9fazTS/iBIgM
 +icg==
X-Gm-Message-State: AIkVDXLlafWAcqGuf2qeo5Yrqjp9irmbmOkRtDR8UtbbNkFNcotb269lz7JPyo1CRp+7ebxbdB+i5qhLSpSsKQ==
X-Received: by 10.55.180.5 with SMTP id d5mr7016284qkf.266.1484819304346; Thu,
 19 Jan 2017 01:48:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.122 with HTTP; Thu, 19 Jan 2017 01:48:23 -0800 (PST)
In-Reply-To: <24b6ca2f-fbe2-bd0a-2fb5-7200f09d9147@linux.vnet.ibm.com>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <20170116194447.d3yzsldsu3qsl5sz@asimov>
 <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
 <20170118144408.GA5120@heinlein.lan>
 <CAARXrtmRRC0ix9cXbe=PKdmw_cs=Eend52A1NKy-9WGa0hJwRA@mail.gmail.com>
 <38683dc2-7d4f-11eb-589c-c87784253610@linux.vnet.ibm.com>
 <CAARXrt=ZcCdUC73c27aY28ZgLo8Fsu7GH49RWc-wySK4AcXnkw@mail.gmail.com>
 <24b6ca2f-fbe2-bd0a-2fb5-7200f09d9147@linux.vnet.ibm.com>
From: Mine <mine260309@gmail.com>
Date: Thu, 19 Jan 2017 17:48:23 +0800
Message-ID: <CAARXrt=wECQNYUOZvVQ0OT9hnB8-za3b2cHoZENkgAC4LhcugA@mail.gmail.com>
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
To: vishwa <vishwa@linux.vnet.ibm.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 19 Jan 2017 09:48:27 -0000

Hi Vishwa,

I checked the code again, and find out it does not set settings back,
but only set it internally.
That's good :)

So the table is updated accordingly:

Mode      | Owner | Set BMC Time  | Set Host Time
------------- | --------- | ----------------------- |
-------------------------------------
NTP        | BMC   | Not allowed      | Not allowed
NTP        | HOST | Not allowed      | OK, and set time to BMC
NTP        | SPLIT | Not allowed      | OK, and just save offset
NTP        | BOTH | Now allowed     | OK, and set time to BMC
MANUAL | BMC   | OK                  | Not allowed
MANUAL | HOST | Not allowed      | OK, and set time to BMC
MANUAL | SPLIT | OK                  | OK, and just save offset
MANUAL | BOTH | OK                  | OK, and set time to BMC

NPT/HOST is the same as NTP/BOTH, which has the same
behavior as MANULA/HOST, they can be merged.

So the updated proposals:
* NTP-BMC
* NTP-SPLIT
* NTP-BOTH (or MANUAL-HOST, or NTP-HOST)
* MANUAL-BMC
* MANUAL-SPLIT
* MANUAL-BOTH

Anyway, please confirm the above logic is correct, and I can follow
the logic in the new code, no matter if my proposal is accepted or not.

Btw, is there any specific reason why the time mode/owner is only changed
when host is off?

Thanks!

--
BRs,
Lei YU

On Thu, Jan 19, 2017 at 4:39 PM, vishwa <vishwa@linux.vnet.ibm.com> wrote:
> hey Lei,
>
> :), I need the data if you see that 'time manager' is updating settings.
> There is no way it can do that since there is no instance of 'Set' being
> called on settings from timemanager.
>
> Its one of these only:
>
> 1/. setting::Get on the first boot
>
> 2/. Wait on the signal from settings
>
>
> On 01/19/2017 01:07 PM, Mine wrote:
>>
>> Hi Vishwa,
>>
>> Thanks for the detailed explanation, it helps a lot.
>> Please see my comments inline.
>>
>> On Thu, Jan 19, 2017 at 2:11 PM, vishwa <vishwa@linux.vnet.ibm.com> wrot=
e:
>>>
>>> hey Lei,
>>>
>>> I will add some here. Hopefully that helps clarify.
>>>
>>> On 01/19/2017 09:18 AM, Mine wrote:
>>>>
>>>> On Wed, Jan 18, 2017 at 10:44 PM, Patrick Williams <patrick@stwcx.xyz>
>>>> wrote:
>>>>>
>>>>> On Tue, Jan 17, 2017 at 03:51:39PM +0800, Mine wrote:
>>>>>>
>>>>>> On Tue, Jan 17, 2017 at 3:44 AM, Patrick Williams <patrick@stwcx.xyz=
>
>>>>>> wrote:
>>>>>>>
>>>>>>> On Fri, Jan 13, 2017 at 03:42:50PM +0800, Mine wrote:
>>>>>>
>>>>>> I should be meant to create two "instances" on the bus, eventually i=
t
>>>>>> looks
>>>>>> something like:
>>>>>> ```
>>>>>> xyz.openbmc_project.Time.Manager
>>>>>> ..................................
>>>>>>
>>>>>>       /xyz/openbmc_project/time/host_epoch
>>>>>>           org.freedesktop.DBus.Peer
>>>>>>           org.freedesktop.DBus.Introspectable
>>>>>>           org.freedesktop.DBus.Properties
>>>>>>           xyz.openbmc_project.Time.EpochTime
>>>>>>       /xyz/openbmc_project/time/bmc_epoch
>>>>>>           org.freedesktop.DBus.Peer
>>>>>>           org.freedesktop.DBus.Introspectable
>>>>>>           org.freedesktop.DBus.Properties
>>>>>>           xyz.openbmc_project.Time.EpochTime
>>>>>
>>>>> There isn't a reason to name the object path "epoch".  /time/bmc and
>>>>> /time/host0 is probably more appropriate.
>>>>
>>>> OK.
>>>>
>>>>>>>> And there will be no =E2=80=9Ccurr_time_mode/owner=E2=80=9D or
>>>>>>>> =E2=80=9Crequested_time_mode/owner=E2=80=9D
>>>>>>>> properties on DBUS.
>>>>>>>
>>>>>>> So these are only stored in phosphor-settingsd now or are they also
>>>>>>> used
>>>>>>> internally for decisions?  I believe the previous implementation ha=
d
>>>>>>> them exposed more for debug purposes.  Are you going to add them to
>>>>>>> the
>>>>>>> journal at least?
>>>>>>
>>>>>> Yes, the time_mode and time_owner are still stored in
>>>>>> phosphor-settingsd, and they
>>>>>> are used internally by phosphor-time-manager, which will register
>>>>>> callback for the
>>>>>> settings' change and handled accordingly.
>>>>>> The difference from the previous implementation is that we do not
>>>>>> expose
>>>>>> these
>>>>>> settings in time-manager's DBus now.
>>>>>
>>>>> There are two aspects for consideration here:
>>>>>
>>>>>       1. The current time manager defers changing the host policies
>>>>> until
>>>>>          the next boot.  We need to continue this behavior.
>>>>>
>>>>>       2. If the process restarts we need it to go back into the
>>>>> "current
>>>>>          state" and not the "requested state".  How do we make this
>>>>>          happen?  The current implementation might also have a flaw
>>>>> here
>>>>>          so maybe we log it as an issue for follow up.
>>>>>
>>>> This is the part I did not understand well on the previous "requested"
>>>> and "current" mode.
>>>> My consideration/question (for previous code) is:
>>>> It has two settings of time mode/owner, one in settingsd, the other in
>>>> timemanager, then
>>>> which service is *really* responsible for the setting?
>>>
>>>
>>> 'Settingsd' provides the system level settings that are settable by use=
rs
>>> at
>>> any point of time. This
>>> should be treated as "Customer request". This does not mean that whatev=
er
>>> that is written to settings
>>> is readily acceptable by the consumers. Putting a value in 'settings'
>>> indicates that 'I want this
>>> value to be used whenever the system condition allows it'. If some
>>> settings
>>> are related to changing
>>> the IP address, then fair enough, we don't really want to defer applyin=
g
>>> that until some system
>>> condition is reached. However, the time owner is something that can onl=
y
>>> be
>>> set when the host is OFF
>>> and this is done to make sure that we start clean and not get into
>>> managing
>>> on the fly offsets.
>>>
>>> So the values that get updated in 'settings' are *Totally* controlled b=
y
>>> settingsd and no other daemon updates the values.
>>>>
>>>> E.g. if current time owner is BMC, and mode is NTP,. when settingsd
>>>> set time owner to HOST:
>>>> 1. timemanager save the owner to requested_owner;
>>>> 2. If host is off, it defers the change, then:
>>>
>>>
>>> That is not true. Its the other way.
>>>>
>>>>      * In settingsd, owner is HOST, mode is NTP;
>>>>      * In timemanager, current owner is BMC, requested owner is HOST,
>>>> mode
>>>> is NTP
>>>>      It's kindly of complicated and confusing;
>>>
>>>
>>> When the Host is OFF, time-manager consumes all the values readily as a=
nd
>>> when the updates are made to
>>> settings since we are still at standby and we are safe.
>>
>> OK, I did not notice it happens on when host is off.
>>
>>>> 3. If host is on, it sets the owner to HOST, and change the mode to
>>>> MANUAL (it has specific
>>>> comments to indicates that HOST and NTP are exclusive), then:
>>>>      * In settingsd, owner is HOST, mode is MANUAL;
>>>>      * In timemanager, current owner is HOST, requested owner is HOST,
>>>> mode is MANUAL
>>>>      So changing settingsd time owner also affects settingsd mode.
>>>>      It looks as if timemanager is responsible for the setting.
>>>
>>>
>>> I am sorry if you feel that this logic is complicated. But let me try t=
o
>>> help you on this. It just
>>> follows one thumb rule and that is:
>>>
>>> * When timemanager receives the signal from settingsd telling that some
>>> of
>>> the settings have changed,
>>>   then it will *
>>>
>>> 1/. Apply the changes into timemanager internal config immediately if t=
he
>>> HOST is OFF ( actually if
>>>   pgood is off )
>>>
>>> 2/. If PGOOD is [On], then the changes are *not* applied into current_*
>>> and
>>> are kept as *requested*.
>>> When the Pgood turns back to [Off] state again ( because time manager
>>> receives a signal telling so ),
>>> that the updates in *request* are consumed into *current* and the
>>> necessary
>>> house keeping is done.
>>
>> OK, this is crystal clear :)
>> But this is not the whole story of the current code. See below example
>> that
>> timemanager also set settings to settingsd or disagrees with settingsd.
>>
>>>> I feel this piece of logic is too complicated, it's better that we
>>>> simplifies it:
>>>> 1. Enforce that settingsd is the owner of settings, timemanager shall
>>>> not
>>>> modify
>>>>       settingsd's settings, but only register callbacks on changes.
>>>
>>>
>>> This is exactly what time manager is doing today. I am not sure why you
>>> are
>>> thinking that time manager
>>> is updating the settings. Settingsd is in *complete* control of owning
>>> 'settings' and time manager
>>> just receives the signal broadcasted by 'settings' telling about a chan=
ge
>>> in
>>> the property.
>>
>> In current timemanager, it **does** set settings to settingsd, as
>> describe above:
>> 0. Settingsd's time owner is BMC, mode is NTP;
>> 1. Someone changes owner to HOST in settingsd;
>> 2. timemanager receives the callback, set the owner to HOST,
>>     and because HOST and NTP are exclusive, it also set the mode to MANU=
AL
>> 3. settingsd's time_mode is now **changed** to MANUAL.
>>
>> Another case the timemanager disagree with settingsd is:
>> 0. Settingsd's time owner is HOST, mode is MANUAL;
>> 1. Someone changes mode to NTP;
>> 2. timemanager receives the callback, and check it's not allowed, it
>> prints a log and do nothing;
>> 3. Now settingsd's time owner is HOST, mode is NTP;
>>      while timemanager refuses this settings, its behavior is still
>> HOST/MANUAL.
>>
>>> The curr_time_mode and requested_time_mode are totally *private* to tim=
e
>>> manager and they are there just to cater to the usecase that I mentione=
d
>>> above. Those *private* settings are *not* settable by an outside
>>> application. They are read-only dbus properties just to help in debug.
>>>>
>>>> 2. Combine the time mode/owner into:
>>>>      * BMC_NTP  =3D=3D> Both Bmc/Host Epoch return the same time as BM=
C's
>>>> NTP
>>>> time;
>>>>                                 Setting epoch is not allowed
>>>>      * BMC_MANUAL =3D=3D> Both Bmc/Host Epoch return the same BMC time=
;
>>>>                                       Setting BMC epoch is allowed,
>>>> setting HOST epoch is not allowed
>>>>      * HOST_MANUAL =3D=3D> Both Bmc/Host Epoch return the same HOST ti=
me;
>>>>                                         Settings BMC epoch is not
>>>> allowed, settings HOST epoch is allowed
>>>>                                         (It looks like BMC_MANUAL and
>>>> HOST_MANUAL can be merged as MANUAL?
>>>>                                          since they are actually the
>>>> same)
>>>>      * SPLIT_NTP  =3D=3D> Bmc and Host Epoch are separated;
>>>>                                   BMC uses NTP time, and setting is no=
t
>>>> allowed;
>>>>                                   Host epoch can be get and set;
>>>>      * SPLIT_MANUAL =3D=3D> Bmc and Host Epoch are separated
>>>>                                         Both can be get and set.
>>>>
>>>> What's your opinion?
>>>
>>>
>>> I hope that helped ?
>>
>> Currently the time_mode/owner has 8 combinations, some of them are not
>> valid.
>> Could you help to verify what's the expected behavior in each
>> combinations?
>>
>> Mode      | Owner | Set BMC Time  | Set Host Time
>> ------------- | --------- | ----------------------- |
>> -------------------------------------
>> NTP        | BMC   | Not allowed      | Not allowed
>> NTP        | HOST | Invalid case     | Invalid case
>> NTP        | SPLIT | Not allowed      | OK, and just save offset
>> NTP        | BOTH | Now allowed     | OK, and set time to BMC
>> MANUAL | BMC   | OK                  | Not allowed
>> MANUAL | HOST | Not allowed      | OK, and set time to BMC
>> MANUAL | SPLIT | OK                  | OK, and just save offset
>> MANUAL | BOTH | OK                  | OK, and set time to BMC
>>
>> If my understanding is correct, then we can see:
>> * NTP/HOST is invalid case, such case shall not exist, the current
>> implementation
>>    either hacks settingsd to change the mode to MANUAL, or just behaves
>> like MANUAL;
>> * NTP/BOTH has the same behavior as MANULA/HOST, they can be merged.
>>
>> That's why I propose to combine the settings to:
>> * NTP-BMC
>> * NTP-SPLIT
>> * NTP-BOTH (or MANUAL-HOST)
>> * MANUAL-BMC
>> * MANUAL-SPLIT
>> * MANUAL-BOTH
>>
>> Then we don't have to "hack" or "disagree" with settingsd, and the
>> logic could be
>> a little simpler.
>>
>>>
>>>>>> What do you mean by "add them to the journal"?
>>>>>
>>>>> Use phosphor-logging.
>>>>
>>>> Yes, the code uses phosphor-logging to send log to journal.
>>>>
>>>>> --
>>>>> Patrick Williams
>>>>
>>>> _______________________________________________
>>>> openbmc mailing list
>>>> openbmc@lists.ozlabs.org
>>>> https://lists.ozlabs.org/listinfo/openbmc
>>>
>>>
>
