Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTyDq4VyszDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 15:05:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XMmwVZaF"; 
 dkim-atps=neutral
Received: by mail-it0-x232.google.com with SMTP id 203so8598675ith.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 20:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GoejrR/Z3X/RGXalMVfCF/vBiXMhUvm/l8C/+vVcVxM=;
 b=XMmwVZaFiAW9aYBP6ZNAWkFbT3d6eKcAGETvjgQfSKteum/3xPKrRzUOoebJPtL+Q7
 dAvlXFuAlFIVDXNb2P0emJSiWux6ND7kHqBITvKaRmNr0wP9dgvDoQirWx/714T7HSpW
 KIcXAyM0laoX5GWGwIE0L8AWSXwoKiV85iWSMv/7t3oqVBNITVSI5yrnGXJ+1WZAKOec
 cKxf8i2MwoiS20bmBe6kkZdSgxenyoyIzjKAloZeURr+om2mukaXyu2hRqBowWLAmtPX
 6PMBVCPiJCBydYTZyjs8eCeiS+SriUDE/mmylgtRBDEzTgNGnBzjHYbYzuqbNnAdY5RJ
 heFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GoejrR/Z3X/RGXalMVfCF/vBiXMhUvm/l8C/+vVcVxM=;
 b=hoMyxyasXWQn/y+Efv6gpqPGkXuGYyo5z8tARtiptfIPIeWduA2bU4qNZu/5kEZ9kA
 OXSqmGgcLsK3t7Q1isUecG+EJSqcLsvcgbdcKiCrnCRPWlMrG4BuZOzqgnQbf1KyriIN
 techvZ7oEkaFgidPKaxKy5iCUmGfLXMDBM4blWt3GSnzRMJClSb55r/cdtfwH8j2AjE+
 FgSHzPYuziK0dbFKBmfDZnGfAYIKu+ALY23jv66r/p/OwFseoWIy3A3yKujEuKHSGL3+
 Lwkr1zFQEPDlLLVsAqBu9sHhk5oWSPFXJdTqiaWz87J7+QajYq7q8m9I0QcXFbsJcIAu
 3bvw==
X-Gm-Message-State: AMke39nyu2SCnrc9MF3+dj4S0p3ZS8UE/M4QEWaNXJ9R4g6krJABeJOrkrKkZS4clCelc89VTxlUkieifRroaw==
X-Received: by 10.36.79.71 with SMTP id c68mr950039itb.47.1487909112733; Thu,
 23 Feb 2017 20:05:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.53.91 with HTTP; Thu, 23 Feb 2017 20:05:12 -0800 (PST)
In-Reply-To: <CACPK8XfDvDi_fUEzFo2vBHU2O=djucY1t27gqY-=RgoJQo3LWQ@mail.gmail.com>
References: <CALLMt=r62pSsVx+5DRsyxRThX0WahOO8wk5ENcc+t7ZfyoPoVw@mail.gmail.com>
 <CACPK8XfDvDi_fUEzFo2vBHU2O=djucY1t27gqY-=RgoJQo3LWQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 23 Feb 2017 22:05:12 -0600
Message-ID: <CALLMt=pAbfD-wUdi2QA=q3Tt_Kv7GXasmDMLY3kJA+83Vh+Vow@mail.gmail.com>
Subject: Re: Target name refactoring
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Fri, 24 Feb 2017 04:05:16 -0000

On Tue, Feb 21, 2017 at 9:00 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Feb 21, 2017 at 8:50 AM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>> Some design decisions came out of my last set of changes in the
>> OpenBMC state area.  There was a proposal to rename our targets
>> responsible for booting and powering on/off the system.
>>
>> Currently we have this:
>> - PowerOn: obmc-power-chassis-on.target    obmc-chassis-start.target
>> - PowerOff: obmc-power-chassis-off.target    obmc-chassis-stop.target
>>   obmc-stop-host.target
>>
>> The obmc-power-chassis-*.targets are responsible for doing whatever is
>> required to apply pgood to the chassis.
>> The obmc-chassis-*.targets are responsible for starting and stopping
>> all host related services
>> The obmc-stop-host.target is where we have the soft power off service
>> (notify host of shutdown, wait for host to shutdown gracefully)
>>
>> Refactoring Proposal:
>> - First the chassis-start and chassis-stop target names don=E2=80=99t ma=
ke
>> sense anymore with the new bmc, chassis, and host state break down=E2=80=
=99s
>> so:
>>   - Rename obmc-chassis-start.target to obmc-start-host.target
>>   - Rename obmc-chassis-stop.target to obmc-stop-host.target
>>   - Rename the current obmc-stop-host.target to obmc-shutdown-host.targe=
t
>
> Can I suggest putting the host before the action?
>
> obmc-host-stop
> obmc-host-start
> obmc-host-shutdown
>

I believe Brad has a naming convention he's shooting for where the
verb comes second.  I'm somewhat agnostic on this but we just want to
be consistent.  With your proposal I'd probably have to rename the
chassis one's from obmc-power-chassis-on to obmc-chassis-power-on.

Thoughts Brad?

>>
>> The target relationships are then the following:
>>
>> obmc-host-start.target requires obmc-power-chassis-on.target
>> obmc-shutdown-host.target requires obmc-stop-host.target requires
>> obmc-power-chassis-off.target
>
> obmc-host-start requires obmc-chassis-poweron
>
> obmc-host-shutdown requires obmc-host-stop requires obmc-chassis-poweroff
>
> I think the rest of your proposal sounds good, from what I understand.
>
> Cheers,
>
> Joel
>
>>
>> When a system goes to the quiesce target, the host state manager will
>> call the obmc-stop-host.target.  Otherwise, the host state service
>> will call the obmc-shutdown-host.target when power off is requested.
>>
>> Thoughts/Comments?
>> Andrew
