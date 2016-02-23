Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x22f.google.com (mail-ob0-x22f.google.com
 [IPv6:2607:f8b0:4003:c01::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 06BC01A0560
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 10:02:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=d0XqUhUE; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=e5FNpj+7; 
 dkim-atps=neutral
Received: by mail-ob0-x22f.google.com with SMTP id dm2so1030069obb.2
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 15:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=2hHatmOYPAdB1RX7NXZdgdgpmmLX5kuY0CbR5yrZumk=;
 b=d0XqUhUExKb39QTq645OLrtByl4ezL53c0B6Rh9Zj5PqxKUeGV6yEqpe3I/Taj8hDR
 YyBMFedd9LgK6GH+6THtE8YAY9piEbsFG1mNV6Zmg7QFbi/ur/1bDhjsMudkqO8Cbn7N
 Df9/sBTj6/xRGaGyw2OdWVzHe7aqJqTCE9z1dooFbPXo4Ptl1B7I2iQsngpY/q6TtMmL
 KUpygZAzeb8T8LeDW9I6JZFl3otlLVTqDpBjqn93BfMqW3Ox3a/6nrjt7KfvCsWnZhqG
 SWcvXjVMBIz6MB6oGZHjTtLnwI4XrNYAcmMciDlCHthfrMJoEiKdyb/KkUaX0p8sANJ7
 FMBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=2hHatmOYPAdB1RX7NXZdgdgpmmLX5kuY0CbR5yrZumk=;
 b=e5FNpj+7bBRYMXdCkE2CT7KpunEExbsT+6D7v8u4m6eAhvGqO5ABeWrJghlmKNAXrm
 5BY6zJzHp6/oloAf+X3+vABhp98OdqyFm+M21j8vI7x40lpbrDY6YB7NAVdqi2Tu7xA+
 agjzWdx8MACzEOy9/eiaTNY9EXJgnqvPBs5hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=2hHatmOYPAdB1RX7NXZdgdgpmmLX5kuY0CbR5yrZumk=;
 b=Id10rZls1UqHFDixyNFIvsCMcgVYM9jdbHKY3PcTp7zNB5KMig0KT6FXSK1Ls2z8Nb
 dEJr6hcIEr+zJrlEw8lw078C5GVVbtKNkjkVB5vGVl9z38wa87urDaCswpZj74RwyQnO
 HBxNQE4YituglOA/fS/eiTJTZ6P6KavEp7llSsd4vTY6aM2qhWcI5fe3EP1jZAO0Y2VT
 4CIWt18psF4swX4janaDNse3HUua5RY20GwoHi7pQfBKQ0FM5xGj0uRgXUDA9dkg6hAv
 NYjbUVOgT+1v3YN/9xzPkQ5JiAcLHq3giJLfBfG+xnFWRvp0YsNc+tjoa3kQvt7k48jT
 s2aQ==
X-Gm-Message-State: AG10YOQ/5SRDq1sJ9i0q00mCdZbeD1+6aGjG89i7zVBmMKkpnUnqOZyMNdsOyEY8+TPYeb4kkWWf/D8m+oxSew==
X-Received: by 10.182.43.168 with SMTP id x8mr2805657obl.29.1456268543765;
 Tue, 23 Feb 2016 15:02:23 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Tue, 23 Feb 2016 15:02:04 -0800 (PST)
In-Reply-To: <1456238703-11117-4-git-send-email-andrew@aj.id.au>
References: <1456238703-11117-1-git-send-email-andrew@aj.id.au>
 <1456238703-11117-4-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Feb 2016 09:32:04 +1030
X-Google-Sender-Auth: 8-nVuXnG6uz1VgM-ch5bdfcasZU
Message-ID: <CACPK8XfMJWUjNv8+fZQyGdKVqN-QVVo-vUVKX0s=vWUD2+AwOg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] obmc-{init,
 update}.sh: Cope with alternate RW FS types
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Feb 2016 23:02:26 -0000

On Wed, Feb 24, 2016 at 1:15 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Busybox's blkid is a little hamstrung, requiring some processing of the
> output to emulate what can be achieved with a couple of options with
> blkid from util-linux.
>
> Similar to findmtd(), the code for probe_fs_type() and blkid_fs_type()
> is duplicated between obmc-{init,update}.sh. Some consideration should
> be given to splitting out common functionality into well-defined
> sourcable scripts.

Why not do that? :)

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../obmc-phosphor-initfs/files/obmc-init.sh            | 15 ++++++++++++++-
>  .../obmc-phosphor-initfs/files/obmc-update.sh          | 18 +++++++++++++++---
>  2 files changed, 29 insertions(+), 4 deletions(-)

> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
> @@ -35,10 +35,22 @@ findmtd() {
>         echo $m
>  }
>
> +blkid_fs_type() {
> +       # Emulate util-linux's `blkid -s TYPE -o value $1`

Put an example of the input and what you expect as the output in the comment.

> +       blkid $1 \
> +               | tr ' ' '\n' \
> +               | awk -F= '/TYPE/ { print $2 }' \
> +               | tr -d '"'
> +}
> +
> +probe_fs_type() {
> +       fst=$(blkid_fs_type $1)
> +       echo ${fst:=jffs2}
> +}
> +
>  rwfs=$(findmtd rwfs)
>
>  rwdev=/dev/mtdblock${rwfs#mtd}
> -rwfst=ext4

Would it make sense to do the same as the init case, where you set
rwfst to $(probe_fs_type $rwdev)?

>  rwopts=rw
>  rorwopts=ro${rwopts#rw}
>
