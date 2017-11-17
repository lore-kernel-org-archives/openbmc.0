Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::234; helo=mail-pg0-x234.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ST/wZDbe"; 
 dkim-atps=neutral
Received: from mail-pg0-x234.google.com (mail-pg0-x234.google.com
 [IPv6:2607:f8b0:400e:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydsYY480mzDqy8
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 09:02:55 +1100 (AEDT)
Received: by mail-pg0-x234.google.com with SMTP id p9so2886894pgc.8
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 14:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0XUCHKGntaBuBNk7vu2WETqJnWTA5qrQELT5aZS93UQ=;
 b=ST/wZDbeMAloeEmWsuwuB99ZCC+qrIfzM0VR6Vlrdn+Nh+ZpbEDJeVe6z6D3rdIAI/
 W8IGR6BPkKzgWMYwAgsTxRJ6pR4+TxBYgRhNd2ubtKq1oUvsQYIi4t1/PBro8ZLzi3B7
 9spqxjjkIykwIsP8hdTI9/ykxNxp/KR9PMNywCe/kAv1egWcUBFv3hKwgw+GGxN/Ug5T
 zUnLBHHInmVpPIH9JZE7cam+O7EEEh7mQ5/C1WirC+2k6dCKIYIamuV5MZSiYEZWZqIb
 hgiGMF8wejACqgXB9fB5zYXU1JmJ51ntc2j6e3rIV+OZPx2rdcjIcTiWnfAQsLAKlf0J
 2Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0XUCHKGntaBuBNk7vu2WETqJnWTA5qrQELT5aZS93UQ=;
 b=CrjGCukFz4OUnLCTLNWjvOBxXliEybiqY7Ri9VyHdfXVcxC4opl4OwbW6VJZEImXMS
 Q9C8r3PErcTJrH3fWJtAa4ZYc6T0veWXkWP9C19G3JZ4HnD0Tb/d4T+1m7M9B8g+maHz
 CA+a/ztvmWHAvW0FXuA2BmvqJaA15lSIz41DBsjfsV6WiR1xKcFR/XUqCFI+ephXDdhi
 xCGTomZmViWUpSLmhP2k1TEyJFtUjLp9QgZCAoVY/CnJOVgwBEIhYUH+E+buFfJRxliq
 aDE3uMXOhSXRN+px06rLDk14z+H74XnJoeBFgTqK1WdT/7KAgzgSKS76bvzN/HDFHsDW
 76ZQ==
X-Gm-Message-State: AJaThX5i9v0xGHAPDJYAyogSar8PXWXN7/pGXc9pU5d9aS3ody3ahdzO
 2M9K1tVWgwcVORBIKO+tKxn7fwJhQt2FeH6eYzbhxQ==
X-Google-Smtp-Source: AGs4zMbjPR+A3lAUleAANvCJl3crTfFlnqVCU9Oi8gDmblujhX1+BOkb7Y1HGXEkCTlMJVyo41MxaavYjAdEXR4ge6U=
X-Received: by 10.84.235.69 with SMTP id g5mr6782768plt.239.1510956172756;
 Fri, 17 Nov 2017 14:02:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.138.38 with HTTP; Fri, 17 Nov 2017 14:02:52 -0800 (PST)
In-Reply-To: <CAO=notwuzbeXZLD7HePcFJ0xqMQRh0hTcOLtjR_qD60SMdL45Q@mail.gmail.com>
References: <C599FC839619124CAC44E062ABB7DFE2C9F407C2@ORSMSX101.amr.corp.intel.com>
 <14315ca0-3c06-5aa3-5b57-d5e3888fd957@ozlabs.org>
 <20171116171412.GD113334@mauery>
 <CAO=notwuzbeXZLD7HePcFJ0xqMQRh0hTcOLtjR_qD60SMdL45Q@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Fri, 17 Nov 2017 14:02:52 -0800
Message-ID: <CAPH-5w4qbYuOifX=PzUCr_7JXQvPcrKBNqocVugbTUwQoCX_0A@mail.gmail.com>
Subject: Re: HPM firmware update
To: Patrick Venture <venture@google.com>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Mihm,
 James" <james.mihm@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Nov 2017 22:02:58 -0000

On Thu, Nov 16, 2017 at 3:28 PM, Patrick Venture <venture@google.com> wrote=
:
> I hate to jump in, but we have a downstream implementation that lets
> the platform specify the data channel but uses OEM IPMI commands to
> control the transfer, including setting it up and triggering events
> related to the update.  We do this to support multiple platforms, such
> as uploading the image over PCI or LPC, and also allows us to stage
> the file for cryptographic signature verification.
>
> It's very similar to the latest email above.
>
> On Thu, Nov 16, 2017 at 9:14 AM, Vernon Mauery
> <vernon.mauery@linux.intel.com> wrote:
>> On 16-Nov-2017 11:14 AM, Jeremy Kerr wrote:
>>>
>>> Hi James,
>>>
>>>> I=E2=80=99ve started looking at using the PICMG HPM specification that=
 was
>>>> recommended as the preferred API for performing firmware updates. This
>>>> is not an open specification, and goes against the principles of the
>>>> openbmc project.
>>>
>>>
>>> Yes, that's very true. My previous experience is on the client-side of
>>> HPM, which is implemented in ipmitool already.
>>>
>>>> The HPM specification must also be purchased from the PICMG standards
>>>> organization, and contains patent liabilities. I think using HPM is a
>>>> non-starter.
>>>
>>>
>>> We could always request DMTF to make it more widely available. However,
>>> unless that does change, I'd agree with you that we'd want to avoid
>>> HPM.1.
>>
>>
>> We don't have to go with HPM though. Our prior version of BMC used a fai=
rly
>> straight-forward model that is not too different than the HPM model, tho=
ugh
>> it was developed in-house. It is pretty generic and could be used to
>> transfer any payload over a variety of transports.
>>
>> If we can define our own 'standard' for OpenBMC firmware update methods,
>> then we can implement that in ipmitool (like the dell oem commands or
>> something).
>>
>> An overview goes something like this:
>>
>> 1) enter FW transfer mode
>> 2) optionally send parameters (no-rollback, deferred reboot, debug, etc.=
)
>> 3) <make a choice for either IPMI streaming or other transport>
>>         a) for streaming
>>                 i) write data blocks as IPMI FW command
>>         b) for usb mass storage
>>                 i) send plug-in IPMI command
>>                 ii) host-side mount usb mass storage device, writes fw i=
mage
>>                 iii) send plug-out IPMI command
>>                 iv) send 'set uri command' (usb://...)
>>         c) for network transport
>>             i) send 'set uri command' (http(s)://..., tftp://..., ftp://=
...)
>> 4) send transfer complete IPMI command
>> 5) check status
>>         status moves from download -> verify -> program -> ready
>>         status can move to error from any state
>> 6) once status moves to ready, firmware update is finished, ready to
>> reboot.
>> 7) send exit fw transfer mode IPMI command. This causes the BMC to
>> reboot unless a deferred reboot has been selected.
>>
>>
>> This mostly describes what the IPMI control does, which is pretty generi=
c.
>> The trickiest bit is offering multiple mechanisms for transport because =
IPMI
>> is not the most efficient method to transport (unless you use 64kB paylo=
ads
>> during the streaming phase. Even then, the TCP protocols are faster beca=
use
>> of round-trip timing (only need an ack rather than a full trip through t=
he
>> IPMI command lookup and execution process.) USB is pretty fast, but not
>> available for every system.
>>
>> --Vernon

To add to Patrick V's comment, our concern with IPMI-only transfers
was also with performance. We tested using a spec implementation (a
POWER8 sample machine running AMI BMC) as well as a toy version of
Brendan Higgins's proposed in-band transfer mechanism and both took
way too long to transfer images.

Vernon:
The USB mechanism sounds interesting. Could you elaborate on what the
BMC-side hardware and software looks like? I'm picturing one of the
BMC's USB PHYs hanging off of a host hub? Is it on the board or an
external cable? What's the backing storage for the mass storage gadget
(assuming you are using gadget)?

thanks
xo
