Return-Path: <raltherr@google.com>
Received: from mail-yb0-x235.google.com (mail-yb0-x235.google.com
 [IPv6:2607:f8b0:4002:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sKrWJ3LnSzDrHp
 for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2016 03:19:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=BIL7M4Ea; 
 dkim-atps=neutral
Received: by mail-yb0-x235.google.com with SMTP id z10so18718491ybh.2
 for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2016 10:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=xvD771Afi4F7PjYKoVzJHYPNd11V9oS3xC943EyQKO0=;
 b=BIL7M4EajAcVcUYXk79mlQDrHRST/Wk64B+irwvzNPoWLizVOTXgNGx03b1aeZhLHT
 0ZZWztdoR61+JXwkQON3CvCYbxmQ6GLzQs816iG3tVfXEl/WIfRUOjPEJegZn7gK+SZs
 Pj8HkVfyojn+QHBqxtvtC13OMIxe41PtJB8Q4I4wXOs+QjVuRzopdO06htUd31mnuXHN
 Zq+h6MrWzP/XF6M9RkctpvlFqZDnmxpfZP/BJ2nOaei+6wf00bK2EU8ItiF3y4RZ5XAW
 SFKP7aPXwErj+gAH1gkyd8I+3Mxhhf58Y0tN0oAiUwYoUKzsEsF6JbEQ1YjWz4IrLr9E
 Z/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=xvD771Afi4F7PjYKoVzJHYPNd11V9oS3xC943EyQKO0=;
 b=hx11xVN9nnmucoo/8m8xqt+gYA/qAo5pvu/5VE+AAl+1X10nnVMGufvwbLkacIxTzl
 X4TQ5acGn6sLD2UdeMrsX32/hN85cTTsbnnc5Xo9qKSlUJnPUua9ItCGY9voV/ISs7oe
 aEjH3AhGmT/CIc98AuQvyxG+Vt3a7o6tBHvrrSI01GPEI6mCBJeb11Bq6yeonSnxaaIJ
 J8YedHR9wTQHMHb/kmiqMN9rNJT08n1EFoL8NIzhIH2UMIf4Nir7i0wMdhGXoezS4+AO
 jD24Peg158KuTXbhqcSRwWVRyMOXwg8tcfpxmJ/hj/6YVWgM+2TW0WLr7QjD9bd6u9BK
 ocjA==
X-Gm-Message-State: AEkoousTcFduSzGthIZVQD5QK+PEOYXQACwM56HzkQM0+YK8AVeKazz4ZCKkNBQ52GfXZk16Cz4nzJT4fIhZ8fUG
X-Received: by 10.37.196.5 with SMTP id u5mr7617955ybf.39.1472145545312; Thu,
 25 Aug 2016 10:19:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Thu, 25 Aug 2016 10:19:04 -0700 (PDT)
In-Reply-To: <64e2267a-cbd5-0ebb-bdf9-a48c5af52e64@linux.vnet.ibm.com>
References: <c91f438b-8baa-808c-35d6-fffb928d22f1@linux.vnet.ibm.com>
 <CAPLgG=koY4pB-kc=2eVCg5+CWVAVHdEN=SWwyBjK+4Bx7cPhyg@mail.gmail.com>
 <64e2267a-cbd5-0ebb-bdf9-a48c5af52e64@linux.vnet.ibm.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 25 Aug 2016 10:19:04 -0700
Message-ID: <CAPLgG=nXS87g8cnkb3ZG0rxxTWarcowMc4gyhJx1KotRz_8uFw@mail.gmail.com>
Subject: Re: Document on : Time Manager in OpenBMC --> Need your review.
To: vishwa <vishwa@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c053e4649cb28053ae898d1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Aug 2016 17:19:09 -0000

--94eb2c053e4649cb28053ae898d1
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 25, 2016 at 4:59 AM, vishwa <vishwa@linux.vnet.ibm.com> wrote:

> Rick,
>
> Thanks for the thoughts. I have put my response in-line. Please let me
> know if you have any feedback on this.
>
> On 08/23/2016 05:14 AM, Rick Altherr wrote:
>
> In the future, please just send the text inline instead of as an
> attachment.
>
> I don't understand the setting hierarchy.  To me,
> /org/openbmc/settings/Host/host0 implies I am modifying something related
> to the host CPU, not the BMC.  TimeMode only applies to the BMC so having
> it under host0 feels weird.
>
> Agree. Doing this in 'host0' is not appropriate. However, the current
> 'settingsd' framework does not allow multiple levels since the need until
> now was only for 'host'. Now that we have a requirement to get something
> new, I have suggested a change to have another entry called 'bmc' and that
> work will be taken in future sprints. So when that change is made, I will
> make a corresponding change to clock as well.
>
> 1. I like the clear separation of NTP vs manual.
>
> 2.1. "Both" seems like what we have today which doesn't really work at
> all.  I suggest omitting it.  "Split" feels like it should work for all
> cases.  If TimeMode is NTP, an offset is recorded.  If TimeMode is Manual,
> the BMC time is set.
>
> We had one of the customers ask for "Both" and that is why we are putting
> this in there.
>

What are they expecting in terms of behavior?  "Both" has the host and BMC
fighting for ownership of the BMC system time which has quirky behavior.


> For the *split* mode, whether it is NTP / Manual, it still demands an
> update to offset.
>

In "Split" with Manual, the BMC time is meant to be set from the host.  In
that case, the offset can be assumed to be zero and the BMC clock set to
the provided time.


>
> APIs:
> 1. What time zone does SetTime assume?  If UTC, make sure to add tests for
> a valid leap second and leap year.
>
>
> It does not handle Time Zones. Its a mere seconds since epoch. Okay.. I
> will add the tests.
>

Seconds since epoch != UTC.  Specifically for a leap second event, a single
POSIX time point is used for both 23:59:60 and the following 00:00:00.  If
the API is supposed to be UTC, specifically state that in the API.  If it's
supposed to be a POSIX time, have them provide a 64-bit integer.


>
> 2. I really dislike APIs that change behavior.  Provide separate
> GetBmcTime and GetHostTime APIs if you must.
>
> I like this idea. Implemented it.
>
> 3. SetNTP is a very limiting name.  if this really changes TimeMode, call
> it SetTimeMode.  That way we can support things like 1588, GPS, etc later.
>
>
> I have changed the way NTP setting gets set completely. There will not be
> an exposed API to change NTP setting. The changes that are done to
> 'time_mode' will be picked up automatically by the daemon and then
> appropriate services are started / stopped.
>
>
> Changes to NetworkManager:
> - I don't see the point of UseNTP for SetDHCP.  Configuring an NTP address
> is different from using NTP as a time source.  It's up to the DHCP server
> to provide NTP options.  Whether the BMC uses them is controlled by
> TimeMode.
>
> The only reason I wanted this in there is if someone wants to take a call
> to put NTP choice in there while changing the BMC networking to DHCP, they
> can do it right then and there than having to make another call.
>

I'm hearing that you are optimizing for a case that we don't know is
important to optimize for.  BMC networking settings are conceptually
unrelated to time settings.  Combining them in the API adds a lot more
complexity as all the places the NTP settings can be modified needs to be
considered.

>
> In addition to this, there are 2 parts to having NTP as TimeMode.
> (1) We can let timesyncd choose NTP settings that have been given by DHCP
> (2) Let timesyncd choose NTP settings that were manually entered using
> "SetNtpAddress"
>

Both of those cases can be handled with a single SetNtpAddress API.


>
> - Add a SetNtpServer API instead of adding to SetAddress4.  NTP is
> entirely separate from IPv4 address configuration.
>
> I do have SetNtpServer and the reason I also chose to make it a part of
> SetAddress4 was the exact same reason I mentioned for the UseNTP= for DHCP.
>
>
> On Thu, Aug 18, 2016 at 4:08 AM, vishwa <vishwa@linux.vnet.ibm.com> wrote:
>
>> Team,
>>
>> Please help look into this document that describes what I think the
>> TimeManager on openBMC systems should look like.
>>
>> Please weigh in your thoughts.
>>
>> Thanks.
>>
>> Vishwanath.
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>>
>>
>
>

--94eb2c053e4649cb28053ae898d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Aug 25, 2016 at 4:59 AM, vishwa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:vishwa@linux.vnet.ibm.com" target=3D"_blank">vishwa@linux.vnet.i=
bm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p><font size=3D"+1">Rick,</font></p>
    <p><font size=3D"+1">Thanks for the thoughts. I have put my response
        in-line. Please let me know if you have any feedback on this.</font=
><br>
    </p><span class=3D"">
    <br>
    <div class=3D"m_-5857520047155842178moz-cite-prefix">On 08/23/2016 05:1=
4 AM, Rick Altherr
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">In the future, please just send the text inline
        instead of as an attachment.
        <div><br>
        </div>
        <div>I don&#39;t understand the setting hierarchy.=C2=A0 To me,
          /org/openbmc/settings/Host/<wbr>host0 implies I am modifying
          something related to the host CPU, not the BMC.=C2=A0 TimeMode on=
ly
          applies to the BMC so having it under host0 feels weird.</div>
        <div><br>
        </div>
      </div>
    </blockquote></span>
    Agree. Doing this in &#39;host0&#39; is not appropriate. However, the
    current &#39;settingsd&#39; framework does not allow multiple levels si=
nce
    the need until now was only for &#39;host&#39;. Now that we have a
    requirement to get something new, I have suggested a change to have
    another entry called &#39;bmc&#39; and that work will be taken in futur=
e
    sprints. So when that change is made, I will make a corresponding
    change to clock as well.<span class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>1. I like the clear separation of NTP vs manual.</div>
        <div><br>
        </div>
        <div>2.1. &quot;Both&quot; seems like what we have today which does=
n&#39;t
          really work at all.=C2=A0 I suggest omitting it. =C2=A0&quot;Spli=
t&quot; feels
          like it should work for all cases.=C2=A0 If TimeMode is NTP, an
          offset is recorded.=C2=A0 If TimeMode is Manual, the BMC time is
          set.</div>
        <div><br>
        </div>
      </div>
    </blockquote></span>
    We had one of the customers ask for &quot;Both&quot; and that is why we=
 are
    putting this in there.<br></div></blockquote><div><br></div><div>What a=
re they expecting in terms of behavior? =C2=A0&quot;Both&quot; has the host=
 and BMC fighting for ownership of the BMC system time which has quirky beh=
avior.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D=
"#FFFFFF" text=3D"#000000">
    For the *split* mode, whether it is NTP / Manual, it still demands
    an update to offset.</div></blockquote><div><br></div><div>In &quot;Spl=
it&quot; with Manual, the BMC time is meant to be set from the host.=C2=A0 =
In that case, the offset can be assumed to be zero and the BMC clock set to=
 the provided time.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv bgcolor=3D"#FFFFFF" text=3D"#000000"><span class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>APIs:</div>
        <div>1. What time zone does SetTime assume?=C2=A0 If UTC, make sure
          to add tests for a valid leap second and leap year.</div>
      </div>
    </blockquote>
    <br></span>
    It does not handle Time Zones. Its a mere seconds since epoch.
    Okay.. I will add the tests.</div></blockquote><div><br></div><div>Seco=
nds since epoch !=3D UTC.=C2=A0 Specifically for a leap second event, a sin=
gle POSIX time point is used for both 23:59:60 and the following 00:00:00.=
=C2=A0 If the API is supposed to be UTC, specifically state that in the API=
.=C2=A0 If it&#39;s supposed to be a POSIX time, have them provide a 64-bit=
 integer.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=
=3D"#FFFFFF" text=3D"#000000"><span class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>2. I really dislike APIs that change behavior.=C2=A0 Provide
          separate GetBmcTime and GetHostTime APIs if you must.</div>
      </div>
    </blockquote></span>
    I like this idea. Implemented it.<span class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>3. SetNTP is a very limiting name. =C2=A0if this really change=
s
          TimeMode, call it SetTimeMode.=C2=A0 That way we can support thin=
gs
          like 1588, GPS, etc later.</div>
      </div>
    </blockquote>
    <br></span>
    I have changed the way NTP setting gets set completely. There will
    not be an exposed API to change NTP setting. The changes that are
    done to &#39;time_mode&#39; will be picked up automatically by the daem=
on
    and then appropriate services are started / stopped.<span class=3D""><b=
r>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Changes to NetworkManager:</div>
        <div>- I don&#39;t see the point of UseNTP for SetDHCP.=C2=A0 Confi=
guring
          an NTP address is different from using NTP as a time source.=C2=
=A0
          It&#39;s up to the DHCP server to provide NTP options.=C2=A0 Whet=
her
          the BMC uses them is controlled by TimeMode.</div>
      </div>
    </blockquote></span>
    The only reason I wanted this in there is if someone wants to take a
    call to put NTP choice in there while changing the BMC networking to
    DHCP, they can do it right then and there than having to make
    another call.<br></div></blockquote><div><br></div><div>I&#39;m hearing=
 that you are optimizing for a case that we don&#39;t know is important to =
optimize for.=C2=A0 BMC networking settings are conceptually unrelated to t=
ime settings.=C2=A0 Combining them in the API adds a lot more complexity as=
 all the places the NTP settings can be modified needs to be considered.=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=3D"#0=
00000">
    <br>
    In addition to this, there are 2 parts to having NTP as TimeMode. <br>
    (1) We can let timesyncd choose NTP settings that have been given by
    DHCP <br>
    (2) Let timesyncd choose NTP settings that were manually entered
    using &quot;SetNtpAddress&quot;</div></blockquote><div><br></div><div>B=
oth of those cases can be handled with a single SetNtpAddress API.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=
=3D"#000000"><span class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>- Add a SetNtpServer API instead of adding to SetAddress4.=C2=
=A0
          NTP is entirely separate from IPv4 address configuration.</div>
      </div>
    </blockquote></span>
    I do have SetNtpServer and the reason I also chose to make it a part
    of SetAddress4 was the exact same reason I mentioned for the UseNTP=3D
    for DHCP.<span class=3D""><br>
    <blockquote type=3D"cite">
      <div class=3D"gmail_extra"><br>
        <div class=3D"gmail_quote">On Thu, Aug 18, 2016 at 4:08 AM, vishwa
          <span dir=3D"ltr">&lt;<a href=3D"mailto:vishwa@linux.vnet.ibm.com=
" target=3D"_blank">vishwa@linux.vnet.ibm.com</a>&gt;</span>
          wrote:<br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Team,<br>
            <br>
            Please help look into this document that describes what I
            think the TimeManager on openBMC systems should look like.<br>
            <br>
            Please weigh in your thoughts.<br>
            <br>
            Thanks.<br>
            <br>
            Vishwanath.<br>
            <br>
            ______________________________<wbr>_________________<br>
            openbmc mailing list<br>
            <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">o=
penbmc@lists.ozlabs.org</a><br>
            <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"no=
referrer" target=3D"_blank">https://lists.ozlabs.org/listi<wbr>nfo/openbmc<=
/a><br>
            <br>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </span></div>

</blockquote></div><br></div></div>

--94eb2c053e4649cb28053ae898d1--
