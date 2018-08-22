Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BhaR4xJN"; 
 dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wCVW2qfHzF2FK
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 13:20:50 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id q127-v6so341059ljq.11
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 20:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oJjShn71TGL3eSjGqauSUHmsUUQzK2/UbDS+sDTmGco=;
 b=BhaR4xJNHeHp/FQHIYNxqLR5MKaeZvuNiM7Tb9hvFHitfCVsUCQG1gnJm5dPLPbW0N
 yvJx4HI5Kwo0iFLoZDC+oLqP+cfPbV2b6DFSSvbGfILGhKVYms2G9YHqzkg0slKy/tdT
 +cl3AeG7ZlK4ex13lmDhuhq5d3dnB9TJQgfhEXGitGQQomcVTbTTCpnsz07tS1Rw4FvV
 VAEE6e+VaznjHxB3G5quUalVJ6Jo7BFg3aibZhlrSff+/YcuHK1DDiP+XUXzRx419p7e
 xOnD6mWA5lmjJULfquQhIt2May6YlDPajEa6KCVHb5sWqM5BmioPacIziAs+kb6swNf1
 yeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oJjShn71TGL3eSjGqauSUHmsUUQzK2/UbDS+sDTmGco=;
 b=LJHXXxE5jUofhtwJ/Lk+GxUEJ7tK4ssZDU1apXWTYhb1imGUl5qLMaoJJMiwvRVPA7
 LGnuG02ZFttZFM+ommbO9Y8FHQ1VKVHw/Xx66PS2W/av5M2bEua+jZHjTbTSi4xiYEql
 OuNlsZZAe0WsAG3iR5VEwZZX71GbznSezUPBzGBg1nmnTMywE1zjtZZ9b1U8peRhHH3y
 dd7nwaIzqwUH5OicSfmGkzWIAr2wnIH43cGJOE4Ou8dfeAANX6JhZNrcYG3eSPev/zc1
 W0WEHWXEH77N5+n03tPnmk9zJUZYLNmPTa/bBLfssjTFLcqWessgG4z96av27Um0gBng
 je7Q==
X-Gm-Message-State: AOUpUlEYyM/k4we4pMLc4N0mqLgcV7gZnUCUjedi66I7BT01Ph36XFhR
 ZtqPI+fj0XVt67Qu3w7ucPunM+uWKi9o6gqjwxniVGoyuPk=
X-Google-Smtp-Source: AA+uWPyUYf4R7kSc3mauuIY8zsTUlXMqw/HRAlQCQX7g4ga+cjUlO+D6rAfj3LvrfUyOA9lO4tfsiQBHasVRhZA0Fgc=
X-Received: by 2002:a2e:8:: with SMTP id 8-v6mr35704333lja.112.1534908045910; 
 Tue, 21 Aug 2018 20:20:45 -0700 (PDT)
MIME-Version: 1.0
From: William Kennington <wak@google.com>
Date: Tue, 21 Aug 2018 20:20:34 -0700
Message-ID: <CAPnigKkG1C-80T-7c18oSAC_s5CpEN2XbaCOY2u9g1jqVv_fmg@mail.gmail.com>
Subject: Announcing gpioplus
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 03:20:53 -0000

Yet another c++ wrapper in a series of changes I've been working on to
make ergonomic c++ abstractions for commonly used library functions.
This project intends to provide a simple c++ interface around the
existing linux userspace gpiolib syscalls. The functionality is
complete and the tests cover the entire interface.

As usual, please let me know what you think of the project. It currently
resides at https://github.com/wak-google/gpioplus. This should find
a new home at https://github.com/openbmc/gpioplus if it receives
good feedback.

Thanks,
William
