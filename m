Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x234.google.com (mail-oi0-x234.google.com
 [IPv6:2607:f8b0:4003:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMd9m5yCQzDvWD
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 16:55:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bfADtifC"; 
 dkim-atps=neutral
Received: by mail-oi0-x234.google.com with SMTP id y198so11246307oia.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 21:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=EgFU8V2WaStXi9oodxUgUhGKZcMEQKaQMQTUTptyq5I=;
 b=bfADtifCjpuoLwtWLp14zi4ZB7UK4DlBV6G96FShTDXMy66AcfEuqj8onsy+Li/d5W
 dtOJzOc+MSFynWDS+ximQp+05q5UyZIozutJJNy1v8Vc6OklbdCPzaWsdpJBAosqV92J
 IdG6zDoQhwR/hJFWkp80WGRI2vl65p+z1ObqBebAp7CPYkcedCV8IV5NUJKDYIeabp+b
 6eXhqukUqHl4LnFRFVMAuUKvhx4m7drImOjDHBSWRfptpwmPp8hBiiBBe6XZMeGP912V
 qGv65OFpCuzsIUk12V2SS/dYabersJw5To2ltTbFA0QCtNrHJ7uT+V3vK7aNKl3CsvIP
 IyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=EgFU8V2WaStXi9oodxUgUhGKZcMEQKaQMQTUTptyq5I=;
 b=PdSFNLzNjP/2H5VR7E8rO3CYMvDUmyFqTpq+7mlcv1OnaB7HNWlqwKIVeeOcZBFrCb
 jmYl5XXDyU4KkD8AIgmkq/3vLJOsMboI0OCoHkOJDAQQpk2o3Zmt+rW4Sa5vlGCLdKa1
 dkLfJ809O0ABBpfdBhnS5bMAwByyPlkBpi90dt+29psTyLacgCcJlXrMQLg4olSRapXO
 e4weYTMu7BGu2q+x6QKJMO16F71mKEoHe/X3OuQbsrvS9hVU7/oEoJc8hI0edvPOulwC
 ZNSheT8O/ygqPE7lRgG0bz9Yp8fQNVIwjtEx197OlpFhfPLr0K3Vcqaqk5+Ds8ATR9GG
 p8yQ==
X-Gm-Message-State: AKaTC02jNsKg451AQLzmLG/pX2ZOipK672XPFF/PJmFP4G0m/abz3H1j9WH8ApKXIF/oE3jAoz7b5+Fn6EMfug==
X-Received: by 10.157.17.26 with SMTP id g26mr7195402ote.230.1479707722730;
 Sun, 20 Nov 2016 21:55:22 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 21:55:02 -0800 (PST)
In-Reply-To: <CALLMt=oZ7neAge4of5KwzEQbA9nZ_ayuaYwFyUPGqN14Oq-5fA@mail.gmail.com>
References: <CALLMt=oZ7neAge4of5KwzEQbA9nZ_ayuaYwFyUPGqN14Oq-5fA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 16:25:02 +1030
X-Google-Sender-Auth: tA3aR7tCqepegfYqMaeWsMCz_mQ
Message-ID: <CACPK8XebH8SnRGkxqSHS=QN1PYyWL2vt-NBw-sNA6d8qL6ZCEw@mail.gmail.com>
Subject: Re: BMC and Host State Management Refactor
To: Andrew Geissler <geissonator@gmail.com>, jdking@us.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 21 Nov 2016 05:55:25 -0000

Hi Andrew and Josh,

On Sat, Nov 19, 2016 at 7:01 AM, Andrew Geissler <geissonator@gmail.com> wr=
ote:
> Josh and I are working two stories this sprint that deal with
> refactoring the bmc and host state management code out of skeleton
> (#772/#783).  Here=E2=80=99s the proposal on this work.

Thanks for sending out your plan, this is great. I have a few comments
that came up as I was reading.

> The overall design for both state management objects is that they will
> provide a set of properties on which to operate.
> - DesiredState
> - CurrentState
>
> CurrentState will be a read only property.

You've chosen to make the desired and current states be separate,
which works. Another option would be to have them be the same list of
states, so you know that when current=3D=3Ddesired you're not waiting on
anything to happen. What do you think?

>
> The host control will have these additional properties:
> - DesiredPowerState
> - CurrentPowerState
>
> Valid states to request for OpenBMC (DesiredState)
> - READY, REBOOT
> Valid states to be in for OpenBMC (CurrentState)
> - NOT_READY, READY (note this proposal removes BASE_APPS and BMC_STARTING=
).

Does this need to consider states where the device is updating? That
is, it is not attempting to be ready to control the host, but it is
turned on and able to accept new firmware?

>
> READY implies all services started and running successfully (i.e. we
> reached obmc-standby.target)
>
>
> Valid states to request for Host (DesiredState)
> - OFF, ON, REBOOT

This might need to distinguish between soft-off/soft-reboot and
printer-on-fire OFF requests.

> Validate states to be in for Host (CurrentState)
> - OFF, BOOTING, BOOTED

STANDBY, BOOTING, RUNNING?

The bikeshed should be blue.

>
> BOOTED implies petitboot has reached it's "ready" state.
>
>
> Valid power states to request for DesiredPowerState
> - OFF, ON
> Validate states to be in for CurrentPowerState
> - OFF, TRANSITION, ON

Does TRANSITION need to distinguish between coming up and going down?

>
> Patrick and I had some discussion on providing more details on the
> host booted state (petitboot vs. os booted) but that can be an
> extension in the future if needed.

I think baking this in from the start is a worthy goal. This then
feeds into the user-facing APIs, weather that is an IPMI sensor or a
REST endpoint, that can be queried to ask "what is that damn computer
up to". If we can make it informative enough that no one ever feels
the need to watch the console output when the machine is booting then
we have done a good job.

Cheers,

Joel
