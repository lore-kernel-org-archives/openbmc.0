Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::234; helo=mail-io0-x234.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u5oYjRmQ"; 
 dkim-atps=neutral
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVZFj59qzzDqp1
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 03:09:13 +1100 (AEDT)
Received: by mail-io0-x234.google.com with SMTP id d13so8155710iog.5
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 08:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sputIZQvdNfJaOy0lix9hUzwRrO57p/pig/dbHprLqc=;
 b=u5oYjRmQ+spqaL1g4534+nBvHO68uqCQyWGz22pk2LoGz2t/gUn2nCRUvTBFyw7hyI
 CVTNY1c2eb826N1Xwt0zIGk5eaDquWbScaU7rXD4FcWeNOe+8nWfXtFwA3FCtPKoIIcC
 RnQbPFcTFKjywlIxGoKkk95lZddPNnfuRPkmQj69YZvUS7CI7sA8sSD4+99mJVE0n+Np
 PqiQvPXpT2zNuv//1s8XHdADlW+uCqHPB9B6CjSMYJrnWghytp4KO1Y3k/vyglQYGa/1
 X1RnZadxvFnyZUrOluTPs2lxkOizEsIsXmKjXC15bGiu0JJOYlvjynbQJ8CuMTRdwUMB
 z7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sputIZQvdNfJaOy0lix9hUzwRrO57p/pig/dbHprLqc=;
 b=F17fZU5eOMKg4AY6L25CewZ4bFGuZ3KRlzfmnydePvmWNcTdR49EhZoEztbOt7nn+R
 CgOv+9Hb8tCKOAqfhNgRj6GJnheUJk7d125ZYcDbcJfeJ0XR/b2pADJJvNDu4BDRuCit
 DCQlsm6o7DG2iOaGkGzcaLE3g77yu32mWYMuIkt1ICTb3R+ItTJR3ooPmPBlXksNfTyl
 XeIzCUfr/DnFRtTd6WHX63+2es61wjInWFaxW1ic1D2u/XQO05EluIOrVXJa56m5i8Rg
 62jdr+7ieeOZ8lxhhgqlvnM+lxSrA26l58S+1RUcmritULT3VJCOuKFiGiEomOnKBYJ7
 UvDg==
X-Gm-Message-State: AKwxytc6VyY6Gg1iXiz4vxTmrWrwsRs8WgvF+P7EzcZaDbMEhm+OSSrP
 +tw1NuX1BMbjaF2zFy0sJc6X9zijRcbLvlTx7P8=
X-Google-Smtp-Source: AH8x227SYqH5WvPPYM80FwgmCSkeui60HwLw2pWl6tCxGA2qvW4JXzVd1P7CyZtkMQiHTSmlvO8DGdMg2ovYH0F86dg=
X-Received: by 10.107.199.7 with SMTP id x7mr27768563iof.64.1517242150755;
 Mon, 29 Jan 2018 08:09:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.145 with HTTP; Mon, 29 Jan 2018 08:09:10 -0800 (PST)
In-Reply-To: <6DB8F483-15F5-407D-8150-DC66F5E00C53@fuzziesquirrel.com>
References: <9330D13C-79E8-4C49-BBEA-EAB55E9C5974@fuzziesquirrel.com>
 <7F891E7C-D7BE-46B8-AE07-3A900334A6F2@fuzziesquirrel.com>
 <6DB8F483-15F5-407D-8150-DC66F5E00C53@fuzziesquirrel.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 29 Jan 2018 10:09:10 -0600
Message-ID: <CALLMt=paCLuWGz7uia=5-1NfEZ_5qPzRxnPiOPohkooPJYz0TQ@mail.gmail.com>
Subject: Re: OpenBMC 1/29 community telecon - Call for Topics
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 16:09:14 -0000

I've got a couple misc one's, time permitting:

- How's the yocto 2.4 update going, any discussion needed on the
separate layer discussion?
- How's SELinux looking?
- Redfish workgroup going somewhere? Seems like we have a few
implementations out there already and people working on more, how do
we converge?
- Other workgroups?  IP KVM (2799), Remote Media (261), SNMP (2800),
User ID Mgmt (273).
- Did we ever get a doc that mapped people's names to IIRC handles?

Thanks,
Andrew

On Mon, Jan 29, 2018 at 9:47 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> I=E2=80=99d like to talk about how OpenBMC might support systems with BMC=
 redundancy.
> Please join to discuss if that is interesting to you.
>
> thx - brad
>
>
>> On Jan 23, 2018, at 1:12 PM, Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>>
>>
>>
>>> On Jan 23, 2018, at 11:42 AM, Brad Bishop <bradleyb@fuzziesquirrel.com>=
 wrote:
>>>
>>> Please reply with any topics for the 1/30 call.
>>
>> Oops - as usual the call will be Monday which is 1/29.
>>
>>>
>>> thx - brad
>>> --------
>>> https://www.teleconference.att.com/servlet/glbAccess?process=3D1&access=
Code=3D85891389&accessNumber=3D2158616239
>>>
>>> Monday, 10:00pm EDT
>>> 888-426-6840
>>> password: 85891389
>>
