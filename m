Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RQ1PVQBY"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qh6c5V9HzDqWc
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 01:33:44 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id d31so28490pgl.7
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=piFRS6v9/FX00QrZt6mFDtCSuor42Ek6XFw78alF75A=;
 b=RQ1PVQBYKHndUYz9NuWRPQYGW9rei7g/z6oaJXNoWdiuDBfwxqCcuWvPUKV8c18Oc7
 BOkk7Xx8NcFTRADkb06tGzwktMCwvePes9XSyOpDiTJ+TV4LB3Svt0er7/R8LpeQ9UCB
 0zXbTtmZ2f0HjuQd898Pn4ZM54KPqIY3sOfyrLhTeQBXpInCzfX6yUF+BlW5KL9sxi+0
 /xmLEphRTMahF4aUqny0IKiDzb0Wl+CQOnen7QooX+HCZULUkc+K8SC9DnTivuJc1aOe
 bZFbjndfYEibxFhJ8J6u/nyfgzmKSSkMSfeqqQLGnR7qWa6+/q3ldo9mC37N84TLAoR3
 pLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=piFRS6v9/FX00QrZt6mFDtCSuor42Ek6XFw78alF75A=;
 b=t+jq2/o4KIeor9gty2eVHsL2MC+r+rBQSWCl9q2gt9m3MV16QVLt0swnl6fQ/smcP+
 li9RpOqUibGVU4k82VQdRLWkVWV6Mf+NSsFxluvHlEKFakhtYxcao+7Zoxdjds6FyN7l
 yO04H5KmZfjqFE3gE+UyVainMYJQTnANRMRG9jHgBmLzP1XCj5aiXkQbU5CrzwnPP96S
 7FzP7nBVtFwbr/nPXHri9graPu49yeiLV+wpI24eHqFNJSW3wCMgMfF9h/43qI50ElJz
 xympPUIKEDY12HFN1+Ovtj4hF7M/Z/eRYv3QnVSE8WPp5FYAaauyplE3b8WiFt8c2900
 U3XQ==
X-Gm-Message-State: APjAAAXUPzS5AL2lHVccL8tI4QxR6RXDujr8yVvRRPYffMFk79MMC2wf
 k1gI6FPKA2DA9LCSelMJ2nfepjGoKXJAm8pobfbNPqIoNX8=
X-Google-Smtp-Source: APXvYqxsoQkkw4M8SDtB3KLB5ZguqEfVhRyy1uLrl5fFYas38mnkS87UCs+tbl+vRp/bAY4LmyR6Y3H/YOKtCeVcMTc=
X-Received: by 2002:a62:415d:: with SMTP id o90mr40565194pfa.236.1556206420784; 
 Thu, 25 Apr 2019 08:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <4ddbeb3bc1b64b1097775eddf9608cd9@Eltsrv03.Eltan.local>
 <CAO=notz9eixtsv48gnJgqsNBK8jx9tLR_vwuL41dZy7pAtpvZw@mail.gmail.com>
 <a666a65dca65479aac93175385efd027@Eltsrv03.Eltan.local>
In-Reply-To: <a666a65dca65479aac93175385efd027@Eltsrv03.Eltan.local>
From: Patrick Venture <venture@google.com>
Date: Thu, 25 Apr 2019 08:33:29 -0700
Message-ID: <CAO=notyfFvATQceE4XkDOQXncB2pN65ODB_O+3ucF4QtTRTQSA@mail.gmail.com>
Subject: Re: bmcweb image upload
To: Wim Vervoorn <wvervoorn@eltan.com>
Cc: "Tanous, Ed" <ed.tanous@intel.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2019 15:33:46 -0000

On Thu, Apr 25, 2019 at 8:17 AM Wim Vervoorn <wvervoorn@eltan.com> wrote:
>
> Hello Patrick,
>
> Thanks for the response. I will try this. Some other thing I noticed is t=
hat the image update now uses a TAR file. Basically it transfers the TAR to=
 the system, then untars the file and uses it. This means the mechanism req=
uires twice the size of the TAR file.

Yikes, that's absolutely true and unusable.  We only do image uploads
over in-band mechanisms today for our platforms.  And in the future,
that is likely going to stay the same for the ast2400s -- although
good to know this issue.

The tar is used for UBI, IIRC< and not a static image layout -- with
the static image layout, does it still use a tarball?  We've stuck
with static layout instead of using UBI for unrelated reasons.

>
> I am now considering to use an ISO file and mount this this will require =
less memory. What do you think about this, do I overlook something or can t=
his be a viable solution?

We just use the actually image-bmc that's generated and a signature
file for the updates, but the code to handle this isn't fully upstream
yet (WIP openbmc/phosphor-ipmi-flash).

>
> Best Regards,
> Wim Vervoorn
>
>
>
> -----Original Message-----
> From: Patrick Venture [mailto:venture@google.com]
> Sent: Thursday, April 25, 2019 4:31 PM
> To: Wim Vervoorn <wvervoorn@eltan.com>; Tanous, Ed <ed.tanous@intel.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: bmcweb image upload
>
> On Thu, Apr 25, 2019 at 2:03 AM Wim Vervoorn <wvervoorn@eltan.com> wrote:
> >
> > Hello,
> >
> > I have an AST2400 OpenBmc with 128 MB of RAM. I found that the firmware=
 upload using WebUI (and Redfish) doesn't work. Bmcweb is killed due to an =
out of memory condition.
> >
> > If found out this is due to the large request size of 30 MB. Will there=
 be an update to the upload mechanism to resolve this large memory requirem=
ent?
>
> I'm so excited for your email!  For a time, I was the only person maintai=
ning an ast2400 with 128MB of RAM.
>
> Here are some things to do straight away:
> look at your bmc image and remove any image_features you're not using
> -- if possible.
>
> That'll help with the problem in general.
>
> To do updates on our end, we have a service triggered by a different upda=
te mechanism that clears the caches, this frees up critical memory for the =
system.  I don't know enough about the redfish approach, but perhaps it cou=
ld be programmed to call a similar service before receiving the image when =
the request is received.
>
> Our package, "google-prepare-update" is just:
>
> prepare_update.service:
> [Unit]
> Description=3DPurge Memory Caches
> [Service]
> Type=3Doneshot
> ExecStart=3D/usr/sbin/purge_cache.sh
>
> purge_cache.sh:
> #!/bin/bash
> # Run sync command.
> sync
> # Purge the three caches.
> echo 3 > /proc/sys/vm/drop_caches
> # Done
> exit 0
>
> >
> > Best regards,
> >
> > Wim Vervoorn
> >
> >
>
>
>
