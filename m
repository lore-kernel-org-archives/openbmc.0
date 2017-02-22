Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x235.google.com (mail-yw0-x235.google.com
 [IPv6:2607:f8b0:4002:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vShvd3WfPzDq60
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 14:01:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aO20eKja"; 
 dkim-atps=neutral
Received: by mail-yw0-x235.google.com with SMTP id v200so73692953ywc.3
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 19:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=fvkBoflTpt8Il3s33Ay9DELSKarmwbDlzhZMlHm/2a8=;
 b=aO20eKjaWB2IQvGIWn9SU3RmRShy2Irpug9HALaLOV/nrkSXoJU/gRBqIA63z5yCDE
 0ElN0A0aYs8IQgwgmB4p5VKldiMXEYmMEJsW/gxA+xy+KLHgsnVAv9BfMJN5IkdGWezu
 1MWHTgPN3FJBB+4geggdBDU7URJu6N3wl+nOuoOs3J8c0/dTazNDZa4DbDrrsJG8c3U6
 YAM+qBGdU8Fx8sxu2dxyLW8+IbgsixmKEnzFY34qL2kAWq6rKnPCnzGJk97E01OqSwz/
 7bF80XP2dXX7RvZQISaoT/Xi7TDMI9ZS51gl1CvE3Wra9q26mRxZtrs+DrwTKA9Wm++M
 uBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=fvkBoflTpt8Il3s33Ay9DELSKarmwbDlzhZMlHm/2a8=;
 b=IBfWjv3E0Zvx4x/5SP/Lepb5fuSMFe0rvKP0YX+rXNmS+4WBvnvF1SsD8BRbtkjci2
 k5XV09sJqb7VSfCuY4JKrZs10ynmI/uVXgbWLWhu3ADxPH6k1wA+CcBZLtWEMb2H5Wk8
 WxX40jGb7SECBkTww4mBo6GWiaq/Qm+2QmAMWQfnldDc2A/sAO22VpSShoPXDiloko8A
 6NoG+7v6NX9GMwD09/qzk8IH9dxliAjgbNJloWG0JbS2RKyvrNHZV3/CxlnV18DmmHRG
 0k377w0BeOn67saZLoyo08wnZFAclvDh6aAm8nD4E4ls/ftK2vtm5kE5WLrE9I1/UWg9
 k0IQ==
X-Gm-Message-State: AMke39kNoHLc3EeBHRunjbB1VuIPXPhpssLZp/01ZtkkCS3zUVSlaoCMNv4u31OL4fykdhwkUkfOWS05axr2vg==
X-Received: by 10.13.202.69 with SMTP id m66mr10646715ywd.11.1487732458524;
 Tue, 21 Feb 2017 19:00:58 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Tue, 21 Feb 2017 19:00:38 -0800 (PST)
In-Reply-To: <CALLMt=r62pSsVx+5DRsyxRThX0WahOO8wk5ENcc+t7ZfyoPoVw@mail.gmail.com>
References: <CALLMt=r62pSsVx+5DRsyxRThX0WahOO8wk5ENcc+t7ZfyoPoVw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Feb 2017 13:30:38 +1030
X-Google-Sender-Auth: UI2SDBhSNsOZo-ziNZMK5LheL1Q
Message-ID: <CACPK8XfDvDi_fUEzFo2vBHU2O=djucY1t27gqY-=RgoJQo3LWQ@mail.gmail.com>
Subject: Re: Target name refactoring
To: Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Wed, 22 Feb 2017 03:01:02 -0000

On Tue, Feb 21, 2017 at 8:50 AM, Andrew Geissler <geissonator@gmail.com> wr=
ote:
> Some design decisions came out of my last set of changes in the
> OpenBMC state area.  There was a proposal to rename our targets
> responsible for booting and powering on/off the system.
>
> Currently we have this:
> - PowerOn: obmc-power-chassis-on.target    obmc-chassis-start.target
> - PowerOff: obmc-power-chassis-off.target    obmc-chassis-stop.target
>   obmc-stop-host.target
>
> The obmc-power-chassis-*.targets are responsible for doing whatever is
> required to apply pgood to the chassis.
> The obmc-chassis-*.targets are responsible for starting and stopping
> all host related services
> The obmc-stop-host.target is where we have the soft power off service
> (notify host of shutdown, wait for host to shutdown gracefully)
>
> Refactoring Proposal:
> - First the chassis-start and chassis-stop target names don=E2=80=99t mak=
e
> sense anymore with the new bmc, chassis, and host state break down=E2=80=
=99s
> so:
>   - Rename obmc-chassis-start.target to obmc-start-host.target
>   - Rename obmc-chassis-stop.target to obmc-stop-host.target
>   - Rename the current obmc-stop-host.target to obmc-shutdown-host.target

Can I suggest putting the host before the action?

obmc-host-stop
obmc-host-start
obmc-host-shutdown

>
> The target relationships are then the following:
>
> obmc-host-start.target requires obmc-power-chassis-on.target
> obmc-shutdown-host.target requires obmc-stop-host.target requires
> obmc-power-chassis-off.target

obmc-host-start requires obmc-chassis-poweron

obmc-host-shutdown requires obmc-host-stop requires obmc-chassis-poweroff

I think the rest of your proposal sounds good, from what I understand.

Cheers,

Joel

>
> When a system goes to the quiesce target, the host state manager will
> call the obmc-stop-host.target.  Otherwise, the host state service
> will call the obmc-shutdown-host.target when power off is requested.
>
> Thoughts/Comments?
> Andrew
