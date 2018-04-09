Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::232; helo=mail-vk0-x232.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gva4Wbqs"; 
 dkim-atps=neutral
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com
 [IPv6:2607:f8b0:400c:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40KlLN27hszDrqF
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 08:27:55 +1000 (AEST)
Received: by mail-vk0-x232.google.com with SMTP id h134so5822630vke.2
 for <openbmc@lists.ozlabs.org>; Mon, 09 Apr 2018 15:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=a/XE1FJL9fSjDvjXHGIbS6TQutD0uyoKCM+m7bez7oY=;
 b=gva4Wbqs32jE2r0uF/6ieDHtEn1t91bokPcsQtEFe+si27Jp8r29SdiY6qXH8bfMY6
 nbOxHTTyKw28rBmzHOlMVfaxG7eiFPlKBv1wpVkCtu9V1Rm+VcuS1blC7rQJ1NxOU/G3
 yhJ6waDkX+T3PyrDC3gdv0ZBXdl5WXI7hsJcNrF/bpp2xILHgCbxK5gjAAQT+xJPoUXb
 NgWaM04D2oEXWNJ/Fb/je5ZPTNn7stypIoZ/i75hWFcnan9W96dnn+d/oJ5J1byT2uF6
 Uyj3b2zzKF4DD7yIpso8rPMET7E9GR1Itvs6ZqoCzNf+gkA3Z3IIXKM6txMHw/7qjlD/
 2Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=a/XE1FJL9fSjDvjXHGIbS6TQutD0uyoKCM+m7bez7oY=;
 b=sUWhB4dzAiL2DlILWI9qkexzhu0m0l40sWuJKbzeISM7i/ZFdoYQGLKPwfUH0FMgu4
 MrVSeWXsp+KeJeZlgY5NZs0mFgzZljQJmNDRfIugVqDfQ6+sb2D/ZsixsQ6oYBtuvo8g
 Ci3HlEL/XxrMtvM8R7t3ACc/i272PYbQYFJpY7mSLHFqkDnV9fJfNV0Mye6ytS22TzMY
 kg5Z8zvo7wcSfxmR23+tyZWtM3CTTlMYBd27Czt0lgllni6ye4M1qD/4rgdjP8JBXnrO
 alKkHHXD8nPKXJqamoTzI6lfTHY8GdOPz4DWjFFtwa/xumMG9Hhl3c6CwKEtCqlmEhm+
 f3ig==
X-Gm-Message-State: ALQs6tDKWZEB2yXxS5DP0FjlgG9xcD9mwCMTfEas7+z7BYL9bF/yM+Q6
 4Mz798P6c1LP6KUD50z+WVACiT3krTowZKeIKlLXxiyA
X-Google-Smtp-Source: AIpwx4+SzFjfpaVMX4AOAsG55U+DdHb+5zMCWuc/NBLRD+FGC/rQxJXvdz7R/IgSwFszdm9S00aq3hd9oUxbbEodpA0=
X-Received: by 10.31.75.129 with SMTP id y123mr24770565vka.117.1523312872269; 
 Mon, 09 Apr 2018 15:27:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Mon, 9 Apr 2018 15:27:31 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Mon, 9 Apr 2018 15:27:31 -0700
Message-ID: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
Subject: YASL Request
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Emily Shaffer <emilyshaffer@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2018 22:27:57 -0000

Everyone,

I'm working on unit-testing in openbmc, and have cracked most of
sdbusplus into mockable pieces and verified I can in fact test against
those mocks with a downstream daemon.  I'll be grabbing an upstream
daemon (or providing a piece of one) to demonstrate how to leverage
the mocks to test OpenBMC.  If one designs with testing in mind, the
designs come out very differently if not, and so getting unit-tests
throughout OpenBMC will be a lot of breaking things apart into
testable pieces.  Anyways, where I'm going with this email is that
everything we do within a daemon needs to be something that can be
mocked -- basically.

***
What do I mean specifically?  Consider, file access.  If a daemon
routes all file accesses throug a common object implementation
provided by a shared library, that shared library can easily also
provide a mock interface for those accesses, such that one can easily
verify behaviors based on file contents without implementing local
files or trying to inject errors.  With a mock's file system
interface, you can simply say that a file was unable to be read, or
written, or opened, etc.  Another example is mocking ctime.  If you
want to test whether something happens after some sleep or period, if
your code can receive a mock version of that library, one can
deliberately control the results of 'time' or 'difftime', etc.  I have
to build these interfaces for some of our downstream daemons and
likely for other parts of OpenBMC, and to avoid code duplication it'll
help to have them in some library.

YASL (yet-another-shared-library) Request.

Previous conversations along these lines lead to the idea that we need
multiple new libraries for various things.  So, this is yet another
use case.  The library itself should be written in such a way that it
can be tested via unit-tests, but depending on how thin of a shim it
is, that isn't always practical.  See:

class FileInterface {
  public:
     virtual int open(const char *filename, int flags) = 0;
};

class FileImplementation : public FileInterface {
  public:
    int open(const char *filename, int flags) override {
        return ::open(filename, flags);
    }
};

class FileMock : public FileInterface {
   public:
     MOCK_METHOD2(open, int(const char *, int));
};

.... then one just uses the FileInterface for their normally direct
posix-style file access.  This can easily wrap iostream, or fstream,
or anything.  And then if we provide some libraries for use by
daemons, they can transition over to them over time, and then they get
mocks for free :D  For a daemon downstream, I've written a ctime
wrapper, I'll submit it for consideration later tonight along with a
few other things, and then I'll reply to this email with links.

***Not meant as a unit-test primer, just trying to provide some real examples.

Patrick
