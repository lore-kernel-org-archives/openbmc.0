Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22f; helo=mail-it0-x22f.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Th13Pn/u"; 
 dkim-atps=neutral
Received: from mail-it0-x22f.google.com (mail-it0-x22f.google.com
 [IPv6:2607:f8b0:4001:c0b::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zBtf71shyzDqpF
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2018 14:32:30 +1100 (AEDT)
Received: by mail-it0-x22f.google.com with SMTP id u62so829461ita.2
 for <openbmc@lists.ozlabs.org>; Wed, 03 Jan 2018 19:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=6zJnBh2ahc1yJH8iE2FxAwSdiBwQTfRONKvoO/6OGeY=;
 b=Th13Pn/umRAR6XN2uAGTzlEses1/amRYw4nDiHSUOLzTMoaLqhC5H7plmU7/RAWEYa
 EuyAwAO6Jlh6r8NKOlcb55DXzhbI009U8AgOfPbfMzXY8N+hEX2471HQOOtwAH2DWaI7
 A2HRqqvnonldHsKEe7z+yQmQD+GvPHcgeyIBIWPqinO575yKdcoL4D65RiBTWSou/e+b
 jRNlJTyP4LRTDkvO076CZ6XGYKZ+IJh0fIgy+etUEBbBOZ53G/A3mYlX9MQGXEpt6fyb
 +RfM6xcmvmTJmq2t54uo+ADJWDzCf3w5hiGEi6q6ciAjsQXdFkwBhWepLxCuSUIx1OxL
 6fUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=6zJnBh2ahc1yJH8iE2FxAwSdiBwQTfRONKvoO/6OGeY=;
 b=EsRiNskSpdD9wYahvTN7/PWGSnt2BoIfduvBtSYCXZuCrkoYl2yo6wEjN5LlSn2yw8
 5kx20L8ZQwmh847C+qs9bLL04MS+Hau9W/cEdSmHX4Y5hgHldLhiIF01wQXgPAdjtVsF
 LNCnOjAET+Ec+bDgfKCUpKU/MUvOfE99o4b0V9Ns3WWq4WOMvhv67u0hDdCMkkXdBRY9
 wfXAmSLCUBJXZKt+RObbv9rBZsP34yqthHkmiIA1TSVzkNJqe15dTuVOSdFvmZ6s26Fj
 0o4YhiG5t8sdym44hhVd4nMJiYTRcxPm5ggTKwVLFNmhKeEWOJMZSyD7pfUFaQJAQZN2
 Nzwg==
X-Gm-Message-State: AKGB3mKZMHpMQIxi3R0qO9o2+ueHLHR0XzGJbb454NEyKX4kZ4QUk8Cq
 zu3+9fykMeI5vd+WN1uJCcEtoOhSjM0Y/AXuiZUfRg==
X-Google-Smtp-Source: ACJfBosCsW8b477qamp77X8PCz0vZenyVBZSyYv0PTZl+q3XIIiA60thLgCr92en9pzrUMCRa93OeA5P+oQf4lfa8Mc=
X-Received: by 10.36.41.137 with SMTP id p131mr4443490itp.68.1515036747241;
 Wed, 03 Jan 2018 19:32:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.160.145 with HTTP; Wed, 3 Jan 2018 19:32:26 -0800 (PST)
In-Reply-To: <000001d38498$aab65d90$002318b0$@linux.intel.com>
References: <000001d37d41$925b7590$b71260b0$@linux.intel.com>
 <CALLMt=oeRyF543vtsNuNdrqafz641B16KzYf5JhyK5b9ve5h8Q@mail.gmail.com>
 <000001d38498$aab65d90$002318b0$@linux.intel.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 3 Jan 2018 21:32:26 -0600
Message-ID: <CALLMt=r4th3U-47o0yNE-hm_9bzp1NF2d4zBrMa62fjncERSyA@mail.gmail.com>
Subject: Re: Is there any tool to query dbus interface property?
To: Yong Li <yong.b.li@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 04 Jan 2018 03:32:32 -0000

On Wed, Jan 3, 2018 at 7:42 AM, Yong Li <yong.b.li@linux.intel.com> wrote:
> Thanks for your information.
>
> What I want is to wait for a property to be an expected value.
> For example, wait for pgood to be 1, to make sure the power is on.
>
> Let me check on the mapper wait command......

May want to take a look at
https://github.com/openbmc/witherspoon-pfault-analysis/blob/master/power-sequencer/pgood_monitor.cpp#L112

That sets up a dbus watch on the pgood property changing and calls a
callback function when it happens.  Sounds more like what you want.

>
> Thanks,
> Yong
>
> -----Original Message-----
> From: Andrew Geissler [mailto:geissonator@gmail.com]
> Sent: Wednesday, January 3, 2018 9:37 PM
> To: Yong Li <yong.b.li@linux.intel.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: Is there any tool to query dbus interface property?
>
> On Sun, Dec 24, 2017 at 11:31 PM, Yong Li <yong.b.li@linux.intel.com> wrote:
>> Hi All,
>>
>>
>>
>> I would like to query a dbus property and make different actions based
>> on the property.
>
> Just querying a property can be done via the busctl tool: busctl get-property xyz.openbmc_project.State.BMC
> /xyz/openbmc_project/state/bmc0 xyz.openbmc_project.State.BMC CurrentBMCState
>
>> Just like the pgood_wait.c in skeleton, but it only supports the pgood
>> property. Is there any a common tool can support query/wait different
>> dbus interface/objects?
>
> Waiting on a dbus service can be done via the mapper tool: mapper wait
> /xyz/openbmc_project/state/bmc0
>
> And this can also all be done in the application code itself using sdbusplus interfaces to mapper and the objects you're interested in.
>
>>
>>
>> If not, I would like to create one based on the pgood_wait.c
>>
>>
>>
>> Thanks,
>>
>> Yong
>>
>>
>
