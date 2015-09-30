Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x22e.google.com (mail-ob0-x22e.google.com
 [IPv6:2607:f8b0:4003:c01::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E1EF91A002B
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2015 10:44:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=jEkh+Nn4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=fk+nMVkq; 
 dkim-atps=neutral
Received: by obbbh8 with SMTP id bh8so19556083obb.0
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2015 17:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=XMQnbqBGUi9NUdyrWXIVJBeYCv1tCSkEOXJLRSmqouQ=;
 b=jEkh+Nn4MeyP4z8ZsEwlidibkJZuE5y4+oJv0ILd9z/cBp3lchc27UDpWftZ5wUuFr
 yD5EhQuMfXjB/9R0+pf5t4Cgiw9muqCvStsKuMC1Krez+z7dNZaG8JWyIBjizPjarDfi
 nc5IR9j93vwUSFmZ+UZIYT8sjLjTuI+9tf7oCJv90eCylNbPWSKQOhGfK3LBI5GdPt9K
 C3mVho1Pei+MSAC+duytyXWJhy4yAAJKvo0/gdS5vq5uok3IiPS8hngtbpUlQnpnZETv
 fO22K1WmnDjnhjxEMDkfyo2KTU51jbmIHnzWXgbEC/+lZaWPrcIPqtkSJmvXRhs3dSQd
 38WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=XMQnbqBGUi9NUdyrWXIVJBeYCv1tCSkEOXJLRSmqouQ=;
 b=fk+nMVkqtluLa7DmPb+o4w0JAHvCP9DvMOtwVtYQx1AhnhE6peifPMEfJkdOZmqScj
 rJb+PRU9q8oJBxX4ojYYNfJFj0QjI8TXuX5I5HZ8Aw8M+MZSDsDwpKVgSYkRZK20KuGx
 2ODKQ7S7NpVfKMSBHCFiVDYJWlpEmT12Hm46M=
X-Received: by 10.182.97.10 with SMTP id dw10mr608551obb.60.1443573879247;
 Tue, 29 Sep 2015 17:44:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Tue, 29 Sep 2015 17:44:19 -0700 (PDT)
In-Reply-To: <722865DA-D254-4972-9020-E6D01F95EC60@bwbmail.net>
References: <722865DA-D254-4972-9020-E6D01F95EC60@bwbmail.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 Sep 2015 10:14:19 +0930
X-Google-Sender-Auth: 07dZ6GvcTZjzKW0cAjIcbK42TWs
Message-ID: <CACPK8Xc9sYaZLTZnHu3V2vQRB6PvO-pYR7uEappp+Mg0210NaQ@mail.gmail.com>
Subject: Re: BSP layers
To: Brad Bishop <brad@bwbmail.net>
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 30 Sep 2015 00:44:44 -0000

Hey Brad,

On Sat, Sep 26, 2015 at 4:47 AM, Brad Bishop <brad@bwbmail.net> wrote:
> https://github.com/bradbishop/meta-aspeed
> https://github.com/bradbishop/meta-openpower

Cool. I had a bit of a look.

Feel free to send me patches for the issues in the kernel tree that
you found. We don't want to be carrying patches to things where the
fix should be in the repository, and that's especially true for
components we own where the patch up-streaming is much easier.

How do we go about building these into something I can boot on a palmetto?

Cheers,

Joel
