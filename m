Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22b; helo=mail-io0-x22b.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rCA0ggfR"; 
 dkim-atps=neutral
Received: from mail-io0-x22b.google.com (mail-io0-x22b.google.com
 [IPv6:2607:f8b0:4001:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zBX6D3bkPzDqlt
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2018 00:37:08 +1100 (AEDT)
Received: by mail-io0-x22b.google.com with SMTP id x67so2087638ioi.9
 for <openbmc@lists.ozlabs.org>; Wed, 03 Jan 2018 05:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8e3n07gx1nEmeVgN8w/6gCqy5mcmYwvkFkyU3YuPug0=;
 b=rCA0ggfRyXHgz63SBcYpGxFlTfdOPEMYxlCVwNwGBnvbNoK+QNX0RNAzyRQDJZUgJD
 4x/Qey1U2SMS/Tf3hBI9I1+xOakWl1PKeaikxVM0m68YLIZ8XPRz4wGj4WlbkrYg3/O6
 t1OBQurszpTv8VlVqdGojh9UaXPZOd8vHjxiDIE3yz9CvHYIc9tejoXuic3EWgpa30Ea
 tJCXonH363C/gu7Tg9sf+wHiWOIyP8fgK1YfU7uBO/YoQDpfFhzhTFc2AkJIbl3dOKGj
 ALQ0M23Zlz6VMVRHrVtqB3ujzu0p7b03Nb+67CTuLUCdJ0EgsROcoi9khm44ruUT6RiI
 oE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8e3n07gx1nEmeVgN8w/6gCqy5mcmYwvkFkyU3YuPug0=;
 b=NKupnTfvn6cstQD2nlcRCldh0sFqz8zWQ1CU1ZX03zQL6zCz65KXYGlnDarrgL46ib
 cPCvtR6yACPad9BIN1yLA6ileyFOpughgGdJWxEt+7yaXlvRtUWxP71bsQg4ydi1eEdi
 MAjRpqwcXJuch5DR1qEbmyxaqzss432SGg659f1G+/QzogmjksoM/CsZ0hhTXDGdWfG3
 FsWOIko+fTp/gDHVOyrNgAGIjrA7pzy6G5iQntGCqpJmSEkPvJYX56brYN8PADYoj3UV
 BlDEIQ940rEy2opXgBhjskdTYmAcm5zgObe4JwA+RQE8NyQlZ91t6EjdBlJhDDEmtyvN
 l5RQ==
X-Gm-Message-State: AKGB3mLYGowrNZJ43u9JM8v7TdRaiSzuwFf4b5mtebhtxZdmnVl6a+aC
 NUZOeKwA+kc/JARxc2iMvM/FRKdfS8M5MtRBXLk=
X-Google-Smtp-Source: ACJfBovzmBZRDsTG4KcR8+6R7HLIK2rM1yes30ivdxyMrvOn8AXz7TynUWmOvT/vxzMknU/44p2A7Uu6t7wfRwtRZUE=
X-Received: by 10.107.139.207 with SMTP id n198mr1525850iod.32.1514986625818; 
 Wed, 03 Jan 2018 05:37:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.160.145 with HTTP; Wed, 3 Jan 2018 05:37:05 -0800 (PST)
In-Reply-To: <000001d37d41$925b7590$b71260b0$@linux.intel.com>
References: <000001d37d41$925b7590$b71260b0$@linux.intel.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 3 Jan 2018 07:37:05 -0600
Message-ID: <CALLMt=oeRyF543vtsNuNdrqafz641B16KzYf5JhyK5b9ve5h8Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Jan 2018 13:37:09 -0000

On Sun, Dec 24, 2017 at 11:31 PM, Yong Li <yong.b.li@linux.intel.com> wrote:
> Hi All,
>
>
>
> I would like to query a dbus property and make different actions based on
> the property.

Just querying a property can be done via the busctl tool: busctl
get-property xyz.openbmc_project.State.BMC
/xyz/openbmc_project/state/bmc0 xyz.openbmc_project.State.BMC
CurrentBMCState

> Just like the pgood_wait.c in skeleton, but it only supports the pgood
> property. Is there any a common tool can support query/wait different dbus
> interface/objects?

Waiting on a dbus service can be done via the mapper tool: mapper wait
/xyz/openbmc_project/state/bmc0

And this can also all be done in the application code itself using
sdbusplus interfaces to mapper and the objects you're interested in.

>
>
> If not, I would like to create one based on the pgood_wait.c
>
>
>
> Thanks,
>
> Yong
>
>
