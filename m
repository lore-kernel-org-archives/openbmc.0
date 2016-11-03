Return-Path: <geissonator@gmail.com>
Received: from mail-oi0-x230.google.com (mail-oi0-x230.google.com
 [IPv6:2607:f8b0:4003:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8yFt3GzfzDvPD
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 08:06:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=YNfUvE87; 
 dkim-atps=neutral
Received: by mail-oi0-x230.google.com with SMTP id v84so111136284oie.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 14:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=xTmnVNcTHXhWsl+yldBhNKTw5jnpRk0Mj2nH0apL8d0=;
 b=YNfUvE87ado9xKhlroQ6pEBd+gbdhFn/wUjewRlCWeMcE0zyGPJxZ72wLhTnSK8i/7
 w9MiQc4PkDRm+65tnDH8+GpFzE447v/AiQzQPEPEiwwNlGqoVmH8qwOZfUohV88ouYco
 ibZoRyFJaLCK3gGu9iVK9oMK9AVonSScyTF/ir86Er+A6b463ns+XJo9x7PdJpDxGApG
 Q6zxAR8uOM/oYIody4mdDjpLTuLwB1Yc2BCwARwri9WlswVb0dZ3cotubFLXp2mSk8rg
 bjneU1w8hY/BN1vmGyy60Dry3kTgjPy+xH0hshN2g2ZeI7Y4BYOXinISx8LuLQZ0AlB/
 NPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xTmnVNcTHXhWsl+yldBhNKTw5jnpRk0Mj2nH0apL8d0=;
 b=I8E9x4nfBqB5UtEUR4IGna4SyhAHzZIAf/w7K3YyjU4c7bWAnSn3LdkHotnCwEe2Jj
 xJFa7DNLXSnsFaewPabCLhuSSUCGMcWWomY648GJnMF0/AoVWGw/FQQou+GKuKmGH6CJ
 bLV838qyOTVFvHGfNZeTfGD2HhhzoNHfG22U7M6nEEnINhxZPMAqGdqMyIS8atl5DwPg
 MujW7c2NAecU3BvP+laTS0bsbmwFeFGoW8WVA/lTh3LhV65faivHTJZ7JRiXWURlR9zc
 13u8ufBuJx5W5YhH+HrR2fGxbBw5HIK68fBbKTpGxMqdnIQm9LJO8tqq/7GC3pi4DykH
 4i/w==
X-Gm-Message-State: ABUngvdwy/lhQE2kiiSGGEFf8kcuN5JKgWRs0biQrZ69oKL1TpHjGs+8apXA2wJcAx8Z+ZUdi1gZ42UoNUlbiQ==
X-Received: by 10.107.27.142 with SMTP id b136mr10262440iob.15.1478207216096; 
 Thu, 03 Nov 2016 14:06:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.83 with HTTP; Thu, 3 Nov 2016 14:06:55 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 3 Nov 2016 16:06:55 -0500
Message-ID: <CALLMt=oL-4VXYd5kiKgMW7h_7B2gnx1wHv=pHo0pLk=2SuU=8g@mail.gmail.com>
Subject: Event Log Error Definitions - RFC
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 03 Nov 2016 21:06:59 -0000

The openbmc event log is in full swing with Adriana and I working on
it last sprint and this sprint.  I'd like to throw some
questions/design thoughts on there for this sprints current work.

A little background first though
- The initial commit, with the elog interface can be found here:
https://gerrit.openbmc-project.xyz/#/c/660/
- You can follow the commit history in the upper right to see all of
the code associated with it

The event log is primarily used to log errors that occur within the
system.  Think things like my power supply isn't working or a core
wont start or a seeprom has bad vpd.  Our design is to define errors
within a yaml file (elog.yaml), compile (elog-gen.py) those into a
header file for compile time validation (elog-gen.hpp), and then have
the code use the defined error codes when they hit errors.

The event log uses exceptions.  When a user creates an event log, it
throws an exception.  That exception can be caught and handled by
calling code or it will be propagated up into the sdbusplus code which
will then (hand waving here) send the exception over to the calling
application and turn it back into an exception for the calling
application to handle.  The idea is that application code looks the
same (try/catch) when it's calling an internal function and a dbus
interface.

Now for this sprint, I'm working on a story to allow us to define the
errors within the phosphor-dbus-interface repo, but to have the meta
data associated with the error stay in the phosphor-logging repo.  The
story is https://github.com/openbmc/openbmc/issues/731

Currently the design is that all errors are defined within the
phosphor-logging/elog.yaml file but we want to move to a portion of
the error being defined within the phosphor-dbus-interface repo.  The
idea is that you define the errors a dbus application can return when
you're defining it's interface, but the meta data (i.e. the data you
collect with the error like file name info and errno) is defined
within the phosphor-logging repo.  This ends up being a bit of a pain
for a dev because they have to update 2 repo's to add a new error but
the goal is to have a fairly minimal set of errors defined that can be
shared between applications (and it feels architecturally correct,
define the errors in the interface, define the data associated with
those errors in the event log).  We foresee the meta data that can go
with errors growing in the future (calling out a piece of defective
hardware is one example).

So here's what I'm thinking:

phosphor-dbus-interface/Common.errors.yaml
- name: FILE_NOT_FOUND

phosphor-logging/elog.yaml
- name: FILE_NOT_FOUND:
        msg: "A required file was not found"
        level: INFO
        meta:
            - str: "ERRNUM=0x%.4X"
              type: int
            - str: FILE_PATH=%s
              type: const char *
            - str: FILE_NAME=%s
              type: const char *

The tool phosphor-logging/elog-gen.py is what will take the .yaml
files, validate all errors defined in phosphor-dbus-interface have a
corresponding entry in elog.yaml and then generate the elog-gen.hpp
file.  We want to keep the overlap minimal so putting most of the data
in the phosphor-logging repo makes the most sense to me.

The Common.errors.yaml is where we put common errors shared across
multiple dbus applications.  The apps will also have their own
specific yaml files in phosphor-dbus-interface when needed (i.e.
Inventory.errors.yaml).

Thought/Comments/Questions?

Andrew
