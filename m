Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mEhL0TEC"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qfk31KtRzDqZw
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 00:30:50 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id w24so11209620plp.2
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 07:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vzVv1bZKeAG1jTGaHDi1U7VqHMZ09oa5Dx/C0+o+byY=;
 b=mEhL0TECWYmx/Y0ccTfZw+/iMNb/mS985XzwJnEw++Sme+pvrlhvXAjks2Uyfedsej
 xHGHSNdFm6qeY8chHYdTG0ZxmUu8EZTbHlGh2OsmxOR7XehhHfKPIFmUj+3aOW0Dk6jb
 PuIBI6jxLTZAVOvQ4ZCqpKLVRtJspVVXSpmFxeCx5OsAiyoPT4R2IGGLgpAMpSx3HswA
 c76C6m7pvru2Iq2cNhzw4YyCC5+I2z+oYnu1VB4lgPYpHfTyAq9bVJEWrD43ef4a6BYc
 qVEEdW8MBq6MbUaCkt8ebaA8PPDZHQg7GB9cQMABw3Xbkme77Lcytc/hFKzEGksDKoVi
 XdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vzVv1bZKeAG1jTGaHDi1U7VqHMZ09oa5Dx/C0+o+byY=;
 b=Cl2cl1hwbbvqRTOxzbxsmqPKm1rxmjygwTj+dS8McodxM0q4gxmfisJct3fiqd+WX3
 xNzzjnDktkzvhg5FME6ffDJ9DD35R+AbcUUgt5NhBLYRO8j1bHtL9bOwgU/YnSOfaYo5
 k0WvQNmQubj6mJXcdQnlN6FRIIPt397etLpNdGzCCCptVxP2rXJ4tAY4KtxgsBTq9RDY
 RO/Niq4j/DcCxmJvYq1SX5uMbHdHH0hZ5o6AEP5m8zsQNgzP84/mHbhLtPJxPiTf9fns
 GZfcAE5X1WDa5KPssVOONAiNTnyQ2msAfpOUpciec5nNlRqEogYU5rFQFj+8WeI5HS1b
 LLiQ==
X-Gm-Message-State: APjAAAUtH2uKHgewNxii5So8sSWYfm3W7VUDzbHKJiewHa8Gd7vhAWy3
 PI0TSLw8mMEriQcprhEseMAxpJI8GeBM+ECEBWesRw==
X-Google-Smtp-Source: APXvYqz/OeFyoiXBZFD+0WGOtGor+NCA81FuNUvzIgegNyrYJnwO/SpNzloK7jORBZ0EBVwWHVgn2XmgUUlu2T7092E=
X-Received: by 2002:a17:902:e183:: with SMTP id
 cd3mr39950017plb.233.1556202646579; 
 Thu, 25 Apr 2019 07:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <4ddbeb3bc1b64b1097775eddf9608cd9@Eltsrv03.Eltan.local>
In-Reply-To: <4ddbeb3bc1b64b1097775eddf9608cd9@Eltsrv03.Eltan.local>
From: Patrick Venture <venture@google.com>
Date: Thu, 25 Apr 2019 07:30:35 -0700
Message-ID: <CAO=notz9eixtsv48gnJgqsNBK8jx9tLR_vwuL41dZy7pAtpvZw@mail.gmail.com>
Subject: Re: bmcweb image upload
To: Wim Vervoorn <wvervoorn@eltan.com>, "Tanous, Ed" <ed.tanous@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 25 Apr 2019 14:30:52 -0000

On Thu, Apr 25, 2019 at 2:03 AM Wim Vervoorn <wvervoorn@eltan.com> wrote:
>
> Hello,
>
> I have an AST2400 OpenBmc with 128 MB of RAM. I found that the firmware upload using WebUI (and Redfish) doesn't work. Bmcweb is killed due to an out of memory condition.
>
> If found out this is due to the large request size of 30 MB. Will there be an update to the upload mechanism to resolve this large memory requirement?

I'm so excited for your email!  For a time, I was the only person
maintaining an ast2400 with 128MB of RAM.

Here are some things to do straight away:
look at your bmc image and remove any image_features you're not using
-- if possible.

That'll help with the problem in general.

To do updates on our end, we have a service triggered by a different
update mechanism that clears the caches, this frees up critical memory
for the system.  I don't know enough about the redfish approach, but
perhaps it could be programmed to call a similar service before
receiving the image when the request is received.

Our package, "google-prepare-update" is just:

prepare_update.service:
[Unit]
Description=Purge Memory Caches
[Service]
Type=oneshot
ExecStart=/usr/sbin/purge_cache.sh

purge_cache.sh:
#!/bin/bash
# Run sync command.
sync
# Purge the three caches.
echo 3 > /proc/sys/vm/drop_caches
# Done
exit 0

>
> Best regards,
>
> Wim Vervoorn
>
>
