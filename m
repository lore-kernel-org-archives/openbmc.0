Return-Path: <peterh@google.com>
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vccrQ1NjfzDq8g
 for <openbmc@lists.ozlabs.org>; Tue,  7 Mar 2017 11:25:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UydK/KTz"; 
 dkim-atps=neutral
Received: by mail-io0-x229.google.com with SMTP id l7so125595208ioe.3
 for <openbmc@lists.ozlabs.org>; Mon, 06 Mar 2017 16:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1G1Cz3Eu0i3ImEQ8odpLbGdTF2ZXHQ1Se9uEXiW0llE=;
 b=UydK/KTzRUSjVRg1Ti/XhzUI7OJe3X6fvtGip8JWVWvU5RbPPhGZf5SuLmlv0MlDVo
 ILk0DwcP6jj7y4MHRqiUK5lztklaOhm4fgIzNzwgEROT2W3XGkpBCerg3a19G3zOy9hZ
 AMI3xI9kCm0w7yaR5zavfyJS5dEiw3MIiYOHeH6LFPASiS2c/TpKws1CYTGWBM+QZrj0
 USi2LRJAuQMQdG/efe31Qns9aojGRhLZbPJUZBQbbJb4O/9/r5z/ftK7/RY+EdEemRSQ
 yP4a5pnWOl2uemVQboI318Hjfealj5VVfTfnQV6yQx6CMomubGxlQu/2bQjckmcPJSHT
 ojeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1G1Cz3Eu0i3ImEQ8odpLbGdTF2ZXHQ1Se9uEXiW0llE=;
 b=VvA9Nq4eGytK9VO5p0IK5gjEJCKFZL0XtGrKHLBjpVBlOfrpun43fAW3chxqBLErN5
 Adru1o5xhtx4aNd/HB7eRlC9j/NzHQCvi70vShS0aQdqgfKn0S1G7V2ByuVGB8aJ1gH9
 kOxP8lq2esW8Fop02eZ/jm7xCSRWrJfdzM+MkKxZvwqYv4bsHQud4MAbfrbDJMJIP+TS
 y5bqWrwJiSS3eu8pWr0pALhXRK3/B+CbF8TQ0gWx4R7/LLq13jk4SpNY2lg4ux3uCDnU
 vrhqBUeLMg3XfL8JCmz2CbKI2OCX9Z7mn5U0Q9LsK/ZevDufpxRVZccuVcBYgAul8QRl
 DSBw==
X-Gm-Message-State: AMke39kX1gG16pQ3brq8tVw2ik7fm3zNnrAwy7TFMQx5ILKf1jeXAheOMQJgzvk8wDEPcYuUhuJdJg/Z0pwOdeVp
X-Received: by 10.107.180.145 with SMTP id d139mr17950950iof.101.1488846338116; 
 Mon, 06 Mar 2017 16:25:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.170.22 with HTTP; Mon, 6 Mar 2017 16:25:37 -0800 (PST)
From: Peter Hanson <peterh@google.com>
Date: Mon, 6 Mar 2017 16:25:37 -0800
Message-ID: <CAPozSNrAzFnZpP9PgTXUtPvDtF6Ag6dijOqYhMn4f8OQs2OqFg@mail.gmail.com>
Subject: Zaius can use a backport of pmbus device support
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 07 Mar 2017 00:25:42 -0000

Device support added to 4.9 can be used to support the Zaius power brick.

The relevant commit is cc00decf0e280953e9067e938ad331f93bda8b40
also available as https://patchwork.kernel.org/patch/9245427/

Tested the patch - it works. Suggesting to backport that commit.

Of course, pulling ahead to 4.10 would work too...
