Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xfpbD5GCFzDqXy
 for <openbmc@lists.ozlabs.org>; Sun, 27 Aug 2017 05:52:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XEhawBje"; 
 dkim-atps=neutral
Received: by mail-it0-x232.google.com with SMTP id n5so11183881itb.1
 for <openbmc@lists.ozlabs.org>; Sat, 26 Aug 2017 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ZC1RzIT00I4QakB0vaX5xdoAKBs0vYQHuljxCtg1qM4=;
 b=XEhawBjecOXVqJXjC19vEWvcD+U48zNw+nN21I6teC/UYIZXhIjpdAf/0SJM1jAfMq
 UzVbo6JCUYdAcDyESLALo9MAtRDcN6tsrQvg2Eg27oCeu/Sk5ypyN4+dZTJSRh6ziVUD
 Tk1EryppPT1cTb9MX0CKLF5RzUxLxFqiLzC4XCiBDPjamrlBRhm8oQawRqrcg8H7ViLW
 Jiyjo3RWKO1cjCcRMT6U/slRqD66ACL/01m2IYmu1SCqPnM2ftwMU8in8wGMXtPjP3eZ
 ANkieeuGBnPeLOKTtsRjZ0D45qDvBQK1N7+QqqEVxCM0Tey3XC6HwMwq/VgVZkrtZ2C/
 Q2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ZC1RzIT00I4QakB0vaX5xdoAKBs0vYQHuljxCtg1qM4=;
 b=NqcYAqLAgZT07/yf4nmeILBtd0UFWlvEvM8THuq5jHhaiEJmOhO7viC6rGIQOfvoqV
 kTZD6IP+mzjj9GoSn65FofFw/rhsQmGX4dO8gS40fWgU5PdoFoVQue0+1b5HctYlADAc
 XWO9E330AueB8yJFCkx5KYIdw0o1obwIChU7gRh5nK2v1IHdnC5ZIYYa0zgDl8K+ZpPq
 oGFGJJfK7xBXIoMeIs3EicJWr2VqQN4hmC+Y81FJDh96GRVPzWIUsaDQ9m9GB9aQpVfR
 gJO2A0p4GoLP89rhXc/N8ydWQWAc3sbt6q1JuV7Ecr5FSoWOkDWtShBA5gxqMWYSx9I8
 iP8A==
X-Gm-Message-State: AHYfb5gUSgAJnEsbP6NaamhP4THMJl1FXhNsyZK9HdW5U/VUsMo9xdmL
 4KKQELfjNfHf1ZsLZU+NIC5ypFa6AQ==
X-Received: by 10.36.91.21 with SMTP id g21mr2059957itb.73.1503777142448; Sat,
 26 Aug 2017 12:52:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.182.139 with HTTP; Sat, 26 Aug 2017 12:52:22 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Sat, 26 Aug 2017 14:52:22 -0500
Message-ID: <CALLMt=rjGMFrugpQ_Ofzz0ymN7JpM7KpNDn9xffVFmYgR6ChOw@mail.gmail.com>
Subject: openpower.xyz is down
To: Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Sat, 26 Aug 2017 19:52:25 -0000

Hey guys,

Hopefully the jenkins container just needs a reboot.

Andrew
