Return-Path: <chou.brad@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WqDmlXO/"; 
 dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lnR35xtbzDqQV
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 17:19:25 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id o7so26738pll.13
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=TZpSixJit8drWAGGRDok1We5JtW+UAw7GfqGx1YPDfo=;
 b=WqDmlXO/cLcPWqW6+PR4K4LwbyfT+2bDMsfbWs+gtlUj37cj+VWQ1YHDZMEVAgi58p
 6cy+89FwtZllyBmjukYa4LqM/vlvT+fJ7jMlmG+XKHvg2WbzpPcQ5cnVCAY6Q77Ehqk4
 KzevIEMuwFNrCnoLforl2Oa+lYLlE5xZH8c2YWbpHwG06lOJPyRjt4G/vnfZYkc7Ww11
 9mcaYkdIZn/Mp/Gapj3icaExfiKQsOx5IFtCmn52znZ0C2HTW40+Yfm9yU4NOiShz1r2
 fxtliv4y70Hg7KvTLU+c6CemorqwJfJgygQfhl2uwW0oDrrYn9Tglr3J8wDycgA+L1Oa
 FvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=TZpSixJit8drWAGGRDok1We5JtW+UAw7GfqGx1YPDfo=;
 b=Zgd9mZifd7H7Itrwk8y45X8BE0u/Z3wWQ/Kd8uBWrQMNVOOGEumWqjylfqnFdEgHCN
 W1Fi5Lf53V7R/LDBot4wr7qEVeyfKtLOhbm3IR67Hff8Md77uYICRRAsx51i557soy3S
 aSvlK+HgH6SRlv6GRxHDvJE07+vIFWDKu/b14qg9WL4pGAiEpSBRE8eenyYcMYVAdc52
 20Zt1kPtR418MWVvmEU/CLrhN52EeegaLEN53SsbIg7XGW/hMAcuvI21WF3Vne9A5nUj
 MXPQuzUAxs1rrr4e6P/9lLZu8rL3yf7mOjZTWJmTCTLnZcJAyTJ7fHCZDxIaMKJmesFA
 H2rg==
X-Gm-Message-State: APjAAAVUq2irIOYAHXrgZnHJq9mRFkXJ2RQjggyJ2Dg7NZb4HEQLk6V0
 a/1JYfy/IQl+KX/lxRXBHUE=
X-Google-Smtp-Source: APXvYqy5n4/UYj+Ru2CMzS2npsVHIMeWaVUv4xmXoAMWvien3xT66d46jm4W6mK1sOGK59/bg3Pz6w==
X-Received: by 2002:a17:902:a98b:: with SMTP id
 bh11mr2178469plb.63.1555658361323; 
 Fri, 19 Apr 2019 00:19:21 -0700 (PDT)
Received: from [192.168.1.2] ([220.130.36.2])
 by smtp.gmail.com with ESMTPSA id c25sm5574700pfo.69.2019.04.19.00.19.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Apr 2019 00:19:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: phosphor-fan-presence-tach failed with DBusMethodError
From: Brad Chou <chou.brad@gmail.com>
In-Reply-To: <c7688048-6b3e-3b18-9b4d-919479bce043@linux.ibm.com>
Date: Fri, 19 Apr 2019 15:19:17 +0800
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FA53D6AD-E6AF-44C1-B2A0-0342A9551E57@gmail.com>
References: <79ECCA67-5A36-48A7-B5DF-5840DC390D8C@gmail.com>
 <c7688048-6b3e-3b18-9b4d-919479bce043@linux.ibm.com>
To: Matthew Barth <msbarth@linux.ibm.com>
X-Mailer: Apple Mail (2.3445.9.1)
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
X-List-Received-Date: Fri, 19 Apr 2019 07:19:28 -0000

Hi Matthew,
This is the log of journalctl -u phosphor-fan-presence-tach@0.service -o =
json-pretty

{
	"_EXE" : "/lib/systemd/systemd",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"__REALTIME_TIMESTAMP" : "1555568618101923",
	"CODE_FUNC" : "job_log_done_status_message",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568618101833",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"_COMM" : "systemd",
	"INVOCATION_ID" : "96facc9c420a4f3091e051b99910cbe3",
	"CODE_FILE" : "../git/src/core/job.c",
	"_SYSTEMD_SLICE" : "-.slice",
	"MESSAGE" : "Started Phosphor Fan Presence Tach Daemon.",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D519;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D836e180;t=3D586c80ae7dca3;x=3Da5277960ea22abcd",
	"SYSLOG_IDENTIFIER" : "systemd",
	"_CMDLINE" : "/sbin/init",
	"_GID" : "0",
	"JOB_RESULT" : "done",
	"_PID" : "1",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"MESSAGE_ID" : "39f53479d3a045ac8e11786248231fbf",
	"JOB_TYPE" : "start",
	"_SYSTEMD_UNIT" : "init.scope",
	"CODE_LINE" : "950",
	"__MONOTONIC_TIMESTAMP" : "137814400",
	"JOB_ID" : "1011",
	"_HOSTNAME" : "mingder",
	"SYSLOG_FACILITY" : "3",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"PRIORITY" : "6",
	"_TRANSPORT" : "journal",
	"_UID" : "0"
}
{
	"__REALTIME_TIMESTAMP" : "1555568618911936",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D51f;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D8433d9c;t=3D586c80af438c0;x=3D93f1aa23393a811f",
	"_STREAM_ID" : "47100c2027b549cfa790b02dd6699d78",
	"__MONOTONIC_TIMESTAMP" : "138624412",
	"_PID" : "2337",
	"_COMM" : "phosphor-fan-pr",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"_SYSTEMD_UNIT" : "phosphor-fan-presence-tach@0.service",
	"SYSLOG_FACILITY" : "3",
	"SYSLOG_IDENTIFIER" : "phosphor-fan-presence-tach",
	"MESSAGE" : "terminate called after throwing an instance of =
'phosphor::fan::util::DBusMethodError'",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"_SYSTEMD_CGROUP" : =
"/system.slice/system-phosphor\\x2dfan\\x2dpresence\\x2dtach.slice/phospho=
r-fan-presence-tach@0.service",
	"_UID" : "0",
	"_SYSTEMD_SLICE" : =
"system-phosphor\\x2dfan\\x2dpresence\\x2dtach.slice",
	"_GID" : "0",
	"_EXE" : "/usr/sbin/phosphor-fan-presence-tach",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"_TRANSPORT" : "stdout",
	"_CMDLINE" : "phosphor-fan-presence-tach",
	"PRIORITY" : "6",
	"_SYSTEMD_INVOCATION_ID" : "96facc9c420a4f3091e051b99910cbe3",
	"_HOSTNAME" : "mingder"
}
{
	"_COMM" : "phosphor-fan-pr",
	"__REALTIME_TIMESTAMP" : "1555568618921247",
	"_GID" : "0",
	"SYSLOG_FACILITY" : "3",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D520;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D84361f5;t=3D586c80af45d1f;x=3D8f95fe0699c6e8a7",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"_CMDLINE" : "phosphor-fan-presence-tach",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"_STREAM_ID" : "47100c2027b549cfa790b02dd6699d78",
	"_EXE" : "/usr/sbin/phosphor-fan-presence-tach",
	"_SYSTEMD_SLICE" : =
"system-phosphor\\x2dfan\\x2dpresence\\x2dtach.slice",
	"_SYSTEMD_INVOCATION_ID" : "96facc9c420a4f3091e051b99910cbe3",
	"__MONOTONIC_TIMESTAMP" : "138633717",
	"_UID" : "0",
	"_TRANSPORT" : "stdout",
	"SYSLOG_IDENTIFIER" : "phosphor-fan-presence-tach",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"_SYSTEMD_UNIT" : "phosphor-fan-presence-tach@0.service",
	"MESSAGE" : "  what():  DBus method call failed",
	"PRIORITY" : "6",
	"_HOSTNAME" : "mingder",
	"_PID" : "2337",
	"_SYSTEMD_CGROUP" : =
"/system.slice/system-phosphor\\x2dfan\\x2dpresence\\x2dtach.slice/phospho=
r-fan-presence-tach@0.service"
}
{
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568619532708",
	"PRIORITY" : "4",
	"_UID" : "0",
	"CODE_FUNC" : "unit_log_process_exit",
	"MESSAGE_ID" : "98e322203f7a4ed290d09fe03c09fe15",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"_PID" : "1",
	"_SYSTEMD_SLICE" : "-.slice",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"_EXE" : "/lib/systemd/systemd",
	"COMMAND" : "ExecStart",
	"__MONOTONIC_TIMESTAMP" : "139245283",
	"CODE_LINE" : "5537",
	"INVOCATION_ID" : "96facc9c420a4f3091e051b99910cbe3",
	"_TRANSPORT" : "journal",
	"EXIT_CODE" : "killed",
	"SYSLOG_FACILITY" : "3",
	"__REALTIME_TIMESTAMP" : "1555568619532806",
	"_GID" : "0",
	"_SYSTEMD_UNIT" : "init.scope",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D521;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D84cb6e3;t=3D586c80afdb206;x=3Da2e66b415469912b",
	"MESSAGE" : "phosphor-fan-presence-tach@0.service: Main process =
exited, code=3Dkilled, status=3D6/ABRT",
	"_CMDLINE" : "/sbin/init",
	"_COMM" : "systemd",
	"EXIT_STATUS" : "6",
	"CODE_FILE" : "../git/src/core/unit.c",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"_HOSTNAME" : "mingder",
	"SYSLOG_IDENTIFIER" : "systemd",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7"
}
{
	"_TRANSPORT" : "journal",
	"CODE_LINE" : "5508",
	"_SYSTEMD_UNIT" : "init.scope",
	"UNIT_RESULT" : "signal",
	"MESSAGE_ID" : "d9b373ed55a64feb8242e02dbe79a49c",
	"SYSLOG_IDENTIFIER" : "systemd",
	"PRIORITY" : "4",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"__REALTIME_TIMESTAMP" : "1555568619542496",
	"_GID" : "0",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"INVOCATION_ID" : "96facc9c420a4f3091e051b99910cbe3",
	"_CMDLINE" : "/sbin/init",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D522;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D84cdcb7;t=3D586c80afdd7e0;x=3D4a46ee5bdffab5af",
	"__MONOTONIC_TIMESTAMP" : "139254967",
	"CODE_FILE" : "../git/src/core/unit.c",
	"_HOSTNAME" : "mingder",
	"_UID" : "0",
	"SYSLOG_FACILITY" : "3",
	"_COMM" : "systemd",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"_SYSTEMD_SLICE" : "-.slice",
	"CODE_FUNC" : "unit_log_failure",
	"_EXE" : "/lib/systemd/systemd",
	"MESSAGE" : "phosphor-fan-presence-tach@0.service: Failed with =
result 'signal'.",
	"_PID" : "1",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568619541125"
}
{
	"CODE_LINE" : "3558",
	"PRIORITY" : "6",
	"_CMDLINE" : "/sbin/init",
	"_UID" : "0",
	"_TRANSPORT" : "journal",
	"_COMM" : "systemd",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D527;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D86787b2;t=3D586c80b1882d6;x=3D16bce9a8a50a44e7",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"_SYSTEMD_UNIT" : "init.scope",
	"_HOSTNAME" : "mingder",
	"_SYSTEMD_SLICE" : "-.slice",
	"_GID" : "0",
	"CODE_FILE" : "../git/src/core/service.c",
	"MESSAGE" : "phosphor-fan-presence-tach@0.service: Service =
RestartSec=3D1s expired, scheduling restart.",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"__MONOTONIC_TIMESTAMP" : "141002674",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"__REALTIME_TIMESTAMP" : "1555568621290198",
	"_EXE" : "/lib/systemd/systemd",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"SYSLOG_FACILITY" : "3",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"CODE_FUNC" : "service_dispatch_timer",
	"_PID" : "1",
	"INVOCATION_ID" : "96facc9c420a4f3091e051b99910cbe3",
	"SYSLOG_IDENTIFIER" : "systemd",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568621290104"
}
{
	"CODE_FILE" : "../git/src/core/service.c",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"SYSLOG_FACILITY" : "3",
	"_SYSTEMD_UNIT" : "init.scope",
	"_COMM" : "systemd",
	"CODE_LINE" : "2172",
	"INVOCATION_ID" : "96facc9c420a4f3091e051b99910cbe3",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"CODE_FUNC" : "service_enter_restart",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"__MONOTONIC_TIMESTAMP" : "141044909",
	"_EXE" : "/lib/systemd/systemd",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568621332340",
	"MESSAGE_ID" : "5eb03494b6584870a536b337290809b3",
	"_SYSTEMD_SLICE" : "-.slice",
	"_HOSTNAME" : "mingder",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"MESSAGE" : "phosphor-fan-presence-tach@0.service: Scheduled =
restart job, restart counter is at 1.",
	"_GID" : "0",
	"_TRANSPORT" : "journal",
	"PRIORITY" : "6",
	"SYSLOG_IDENTIFIER" : "systemd",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D528;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D8682cad;t=3D586c80b1927cf;x=3D88ee0587d013ab68",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"N_RESTARTS" : "1",
	"_CMDLINE" : "/sbin/init",
	"_UID" : "0",
	"__REALTIME_TIMESTAMP" : "1555568621332431",
	"_PID" : "1"
}
{
	"JOB_RESULT" : "done",
	"SYSLOG_FACILITY" : "3",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"MESSAGE" : "Stopped Phosphor Fan Presence Tach Daemon.",
	"_GID" : "0",
	"_PID" : "1",
	"_CMDLINE" : "/sbin/init",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568621463958",
	"_TRANSPORT" : "journal",
	"_HOSTNAME" : "mingder",
	"PRIORITY" : "6",
	"SYSLOG_IDENTIFIER" : "systemd",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"INVOCATION_ID" : "96facc9c420a4f3091e051b99910cbe3",
	"_SYSTEMD_UNIT" : "init.scope",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"_COMM" : "systemd",
	"__REALTIME_TIMESTAMP" : "1555568621464285",
	"CODE_LINE" : "950",
	"_UID" : "0",
	"CODE_FUNC" : "job_log_done_status_message",
	"CODE_FILE" : "../git/src/core/job.c",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D52a;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D86a2fb3;t=3D586c80b1b2add;x=3D53fd37e81b1c0559",
	"_EXE" : "/lib/systemd/systemd",
	"MESSAGE_ID" : "9d1aaa27d60140bd96365438aad20286",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"__MONOTONIC_TIMESTAMP" : "141176755",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"JOB_TYPE" : "restart",
	"JOB_ID" : "1998",
	"_SYSTEMD_SLICE" : "-.slice"
}
{
	"_UID" : "0",
	"JOB_RESULT" : "done",
	"_CMDLINE" : "/sbin/init",
	"CODE_LINE" : "950",
	"MESSAGE" : "Started Phosphor Fan Presence Tach Daemon.",
	"SYSLOG_IDENTIFIER" : "systemd",
	"JOB_TYPE" : "start",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"_PID" : "1",
	"CODE_FUNC" : "job_log_done_status_message",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"_EXE" : "/lib/systemd/systemd",
	"_GID" : "0",
	"INVOCATION_ID" : "bd4bdaf8c8f04f17a5f7d8d2b9c8b7ce",
	"PRIORITY" : "6",
	"_HOSTNAME" : "mingder",
	"JOB_ID" : "1998",
	"__REALTIME_TIMESTAMP" : "1555568621508089",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"MESSAGE_ID" : "39f53479d3a045ac8e11786248231fbf",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"SYSLOG_FACILITY" : "3",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D52b;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D86adad6;t=3D586c80b1bd5f9;x=3D769420352032c3b3",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568621508006",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"__MONOTONIC_TIMESTAMP" : "141220566",
	"CODE_FILE" : "../git/src/core/job.c",
	"_COMM" : "systemd",
	"_SYSTEMD_SLICE" : "-.slice",
	"_TRANSPORT" : "journal",
	"_SYSTEMD_UNIT" : "init.scope"
}
{
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D532;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D86f7e5f;t=3D586c80b207982;x=3D5e8f66bc3dae9aaa",
	"_SYSTEMD_SLICE" : =
"system-phosphor\\x2dfan\\x2dpresence\\x2dtach.slice",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"_CMDLINE" : "phosphor-fan-presence-tach",
	"__REALTIME_TIMESTAMP" : "1555568621812098",
	"_HOSTNAME" : "mingder",
	"SYSLOG_FACILITY" : "3",
	"_GID" : "0",
	"SYSLOG_IDENTIFIER" : "phosphor-fan-presence-tach",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"MESSAGE" : "terminate called after throwing an instance of =
'phosphor::fan::util::DBusMethodError'",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"_TRANSPORT" : "stdout",
	"_PID" : "2359",
	"__MONOTONIC_TIMESTAMP" : "141524575",
	"_SYSTEMD_INVOCATION_ID" : "bd4bdaf8c8f04f17a5f7d8d2b9c8b7ce",
	"PRIORITY" : "6",
	"_EXE" : "/usr/sbin/phosphor-fan-presence-tach",
	"_SYSTEMD_CGROUP" : =
"/system.slice/system-phosphor\\x2dfan\\x2dpresence\\x2dtach.slice/phospho=
r-fan-presence-tach@0.service",
	"_STREAM_ID" : "6a2b58209654429bbca1b7c6bf181604",
	"_COMM" : "phosphor-fan-pr",
	"_UID" : "0",
	"_SYSTEMD_UNIT" : "phosphor-fan-presence-tach@0.service"
}
{
	"_SYSTEMD_CGROUP" : =
"/system.slice/system-phosphor\\x2dfan\\x2dpresence\\x2dtach.slice/phospho=
r-fan-presence-tach@0.service",
	"SYSLOG_IDENTIFIER" : "phosphor-fan-presence-tach",
	"_EXE" : "/usr/sbin/phosphor-fan-presence-tach",
	"__MONOTONIC_TIMESTAMP" : "141582711",
	"SYSLOG_FACILITY" : "3",
	"PRIORITY" : "6",
	"_HOSTNAME" : "mingder",
	"_STREAM_ID" : "6a2b58209654429bbca1b7c6bf181604",
	"__REALTIME_TIMESTAMP" : "1555568621870233",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"_CMDLINE" : "phosphor-fan-presence-tach",
	"_SYSTEMD_INVOCATION_ID" : "bd4bdaf8c8f04f17a5f7d8d2b9c8b7ce",
	"_TRANSPORT" : "stdout",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D533;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D8706177;t=3D586c80b215c99;x=3D42eb32999d52f312",
	"_PID" : "2359",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"_UID" : "0",
	"_SYSTEMD_SLICE" : =
"system-phosphor\\x2dfan\\x2dpresence\\x2dtach.slice",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"MESSAGE" : "  what():  DBus method call failed",
	"_COMM" : "phosphor-fan-pr",
	"_SYSTEMD_UNIT" : "phosphor-fan-presence-tach@0.service",
	"_GID" : "0"
}
{
	"_TRANSPORT" : "journal",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568622203107",
	"EXIT_STATUS" : "6",
	"MESSAGE" : "phosphor-fan-presence-tach@0.service: Main process =
exited, code=3Dkilled, status=3D6/ABRT",
	"__REALTIME_TIMESTAMP" : "1555568622203204",
	"PRIORITY" : "4",
	"SYSLOG_FACILITY" : "3",
	"_CMDLINE" : "/sbin/init",
	"MESSAGE_ID" : "98e322203f7a4ed290d09fe03c09fe15",
	"_SYSTEMD_SLICE" : "-.slice",
	"_UID" : "0",
	"CODE_FILE" : "../git/src/core/unit.c",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"SYSLOG_IDENTIFIER" : "systemd",
	"_GID" : "0",
	"_PID" : "1",
	"INVOCATION_ID" : "bd4bdaf8c8f04f17a5f7d8d2b9c8b7ce",
	"_COMM" : "systemd",
	"EXIT_CODE" : "killed",
	"COMMAND" : "ExecStart",
	"__MONOTONIC_TIMESTAMP" : "141915681",
	"_EXE" : "/lib/systemd/systemd",
	"CODE_FUNC" : "unit_log_process_exit",
	"_HOSTNAME" : "mingder",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D538;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D8757621;t=3D586c80b267144;x=3D50dbb59748c240cb",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"CODE_LINE" : "5537",
	"_SYSTEMD_UNIT" : "init.scope"
}
{
	"CODE_FUNC" : "unit_log_failure",
	"UNIT_RESULT" : "signal",
	"SYSLOG_IDENTIFIER" : "systemd",
	"_GID" : "0",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D539;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D875b376;t=3D586c80b26ae98;x=3D7ceede57b1cf63c5",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"_SYSTEMD_UNIT" : "init.scope",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"__REALTIME_TIMESTAMP" : "1555568622218904",
	"CODE_FILE" : "../git/src/core/unit.c",
	"_COMM" : "systemd",
	"__MONOTONIC_TIMESTAMP" : "141931382",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568622218809",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"INVOCATION_ID" : "bd4bdaf8c8f04f17a5f7d8d2b9c8b7ce",
	"_PID" : "1",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"_TRANSPORT" : "journal",
	"_CMDLINE" : "/sbin/init",
	"_EXE" : "/lib/systemd/systemd",
	"SYSLOG_FACILITY" : "3",
	"CODE_LINE" : "5508",
	"_HOSTNAME" : "mingder",
	"_UID" : "0",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"MESSAGE_ID" : "d9b373ed55a64feb8242e02dbe79a49c",
	"MESSAGE" : "phosphor-fan-presence-tach@0.service: Failed with =
result 'signal'.",
	"PRIORITY" : "4",
	"_SYSTEMD_SLICE" : "-.slice"
}
{
	"SYSLOG_IDENTIFIER" : "systemd",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D556;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D8858d4f;t=3D586c80b368870;x=3Dbd285be09a2b202c",
	"PRIORITY" : "6",
	"_TRANSPORT" : "journal",
	"_COMM" : "systemd",
	"_SYSTEMD_SLICE" : "-.slice",
	"_EXE" : "/lib/systemd/systemd",
	"INVOCATION_ID" : "bd4bdaf8c8f04f17a5f7d8d2b9c8b7ce",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"_UID" : "0",
	"MESSAGE" : "phosphor-fan-presence-tach@0.service: Service =
RestartSec=3D1s expired, scheduling restart.",
	"_PID" : "1",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"_GID" : "0",
	"_SYSTEMD_UNIT" : "init.scope",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568623255178",
	"CODE_FUNC" : "service_dispatch_timer",
	"_CMDLINE" : "/sbin/init",
	"__MONOTONIC_TIMESTAMP" : "142970191",
	"CODE_LINE" : "3558",
	"SYSLOG_FACILITY" : "3",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"CODE_FILE" : "../git/src/core/service.c",
	"_HOSTNAME" : "mingder",
	"__REALTIME_TIMESTAMP" : "1555568623257712"
}
{
	"SYSLOG_FACILITY" : "3",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"N_RESTARTS" : "2",
	"INVOCATION_ID" : "bd4bdaf8c8f04f17a5f7d8d2b9c8b7ce",
	"MESSAGE_ID" : "5eb03494b6584870a536b337290809b3",
	"_TRANSPORT" : "journal",
	"CODE_LINE" : "2172",
	"_SYSTEMD_SLICE" : "-.slice",
	"_EXE" : "/lib/systemd/systemd",
	"CODE_FILE" : "../git/src/core/service.c",
	"_HOSTNAME" : "mingder",
	"PRIORITY" : "6",
	"_UID" : "0",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"__MONOTONIC_TIMESTAMP" : "143105318",
	"CODE_FUNC" : "service_enter_restart",
	"SYSLOG_IDENTIFIER" : "systemd",
	"_GID" : "0",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"__REALTIME_TIMESTAMP" : "1555568623392846",
	"_COMM" : "systemd",
	"MESSAGE" : "phosphor-fan-presence-tach@0.service: Scheduled =
restart job, restart counter is at 2.",
	"_PID" : "1",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D55b;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D8879d26;t=3D586c80b38984e;x=3Dcbae35c18148d750",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"_SYSTEMD_UNIT" : "init.scope",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568623392516",
	"_CMDLINE" : "/sbin/init"
}
{
	"_UID" : "0",
	"_COMM" : "systemd",
	"__REALTIME_TIMESTAMP" : "1555568624108590",
	"CODE_LINE" : "950",
	"_PID" : "1",
	"CODE_FUNC" : "job_log_done_status_message",
	"MESSAGE_ID" : "9d1aaa27d60140bd96365438aad20286",
	"_CMDLINE" : "/sbin/init",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D566;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D892890b;t=3D586c80b43842e;x=3D562735cdc759ad4c",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"_SYSTEMD_SLICE" : "-.slice",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"MESSAGE" : "Stopped Phosphor Fan Presence Tach Daemon.",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568624108502",
	"__MONOTONIC_TIMESTAMP" : "143821067",
	"CODE_FILE" : "../git/src/core/job.c",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"_GID" : "0",
	"PRIORITY" : "6",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"_HOSTNAME" : "mingder",
	"_EXE" : "/lib/systemd/systemd",
	"SYSLOG_IDENTIFIER" : "systemd",
	"SYSLOG_FACILITY" : "3",
	"_TRANSPORT" : "journal",
	"JOB_TYPE" : "restart",
	"_SYSTEMD_UNIT" : "init.scope",
	"JOB_RESULT" : "done",
	"INVOCATION_ID" : "bd4bdaf8c8f04f17a5f7d8d2b9c8b7ce",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"JOB_ID" : "2233"
}
{
	"_SYSTEMD_SLICE" : "-.slice",
	"_PID" : "1",
	"SYSLOG_FACILITY" : "3",
	"_TRANSPORT" : "journal",
	"_EXE" : "/lib/systemd/systemd",
	"CODE_LINE" : "1680",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568624111946",
	"_UID" : "0",
	"__REALTIME_TIMESTAMP" : "1555568624112066",
	"INVOCATION_ID" : "bd4bdaf8c8f04f17a5f7d8d2b9c8b7ce",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"__MONOTONIC_TIMESTAMP" : "143824543",
	"_GID" : "0",
	"_COMM" : "systemd",
	"CODE_FILE" : "../git/src/core/unit.c",
	"MESSAGE" : "phosphor-fan-presence-tach@0.service: Start request =
repeated too quickly.",
	"_SYSTEMD_UNIT" : "init.scope",
	"PRIORITY" : "4",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"SYSLOG_IDENTIFIER" : "systemd",
	"CODE_FUNC" : "unit_start_limit_test",
	"_HOSTNAME" : "mingder",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D567;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D892969f;t=3D586c80b4391c2;x=3D6bda45b32807d5a2",
	"_CMDLINE" : "/sbin/init"
}
{
	"_HOSTNAME" : "mingder",
	"SYSLOG_FACILITY" : "3",
	"__MONOTONIC_TIMESTAMP" : "143830627",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"_GID" : "0",
	"_EXE" : "/lib/systemd/systemd",
	"CODE_FUNC" : "unit_log_failure",
	"_PID" : "1",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"MESSAGE_ID" : "d9b373ed55a64feb8242e02dbe79a49c",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"_SYSTEMD_UNIT" : "init.scope",
	"CODE_LINE" : "5508",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"__REALTIME_TIMESTAMP" : "1555568624118149",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568624114749",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D568;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D892ae63;t=3D586c80b43a985;x=3D48d7d6d11e761693",
	"UNIT_RESULT" : "signal",
	"_SYSTEMD_SLICE" : "-.slice",
	"_UID" : "0",
	"CODE_FILE" : "../git/src/core/unit.c",
	"_CMDLINE" : "/sbin/init",
	"SYSLOG_IDENTIFIER" : "systemd",
	"_TRANSPORT" : "journal",
	"_COMM" : "systemd",
	"INVOCATION_ID" : "bd4bdaf8c8f04f17a5f7d8d2b9c8b7ce",
	"MESSAGE" : "phosphor-fan-presence-tach@0.service: Failed with =
result 'signal'.",
	"PRIORITY" : "4"
}
{
	"MESSAGE" : "Failed to start Phosphor Fan Presence Tach =
Daemon.",
	"_SYSTEMD_CGROUP" : "/init.scope",
	"__MONOTONIC_TIMESTAMP" : "143882036",
	"PRIORITY" : "3",
	"UNIT" : "phosphor-fan-presence-tach@0.service",
	"JOB_RESULT" : "failed",
	"_GID" : "0",
	"CODE_FILE" : "../git/src/core/job.c",
	"_EXE" : "/lib/systemd/systemd",
	"_CMDLINE" : "/sbin/init",
	"_COMM" : "systemd",
	"CODE_FUNC" : "job_log_done_status_message",
	"_MACHINE_ID" : "fa1a707917fa4b75a16ab529dc09c8ce",
	"_SYSTEMD_UNIT" : "init.scope",
	"CODE_LINE" : "950",
	"JOB_TYPE" : "start",
	"_BOOT_ID" : "94b392ebfa2147b6b28f32ce1c87d8a7",
	"INVOCATION_ID" : "bd4bdaf8c8f04f17a5f7d8d2b9c8b7ce",
	"SYSLOG_IDENTIFIER" : "systemd",
	"_TRANSPORT" : "journal",
	"_PID" : "1",
	"_SOURCE_REALTIME_TIMESTAMP" : "1555568624169239",
	"_HOSTNAME" : "mingder",
	"__REALTIME_TIMESTAMP" : "1555568624169565",
	"SYSLOG_FACILITY" : "3",
	"_CAP_EFFECTIVE" : "3fffffffff",
	"_SYSTEMD_SLICE" : "-.slice",
	"JOB_ID" : "2233",
	"MESSAGE_ID" : "be02cf6855d2428ba40df7e9d022f03d",
	"__CURSOR" : =
"s=3D6362c6cda2b64a3eb14f6aa46acd1d7a;i=3D569;b=3D94b392ebfa2147b6b28f32ce=
1c87d8a7;m=3D8937734;t=3D586c80b44725d;x=3D99dec20be5513aa5",
	"_UID" : "0"
}




> On Apr 16, 2019, at 10:21 PM, Matthew Barth <msbarth@linux.ibm.com> =
wrote:
>=20
>=20
>=20
> On 4/16/19 4:53 AM, Brad Chou wrote:
>> Hi All,
>> The phosphor-fan-presence-tach failed as :
>> root@mingder:~# systemctl status phosphor-fan-presence-tach@0.service =
<mailto:phosphor-fan-presence-tach@0.service> --no-pager
>> ? phosphor-fan-presence-tach@0.service =
<mailto:phosphor-fan-presence-tach@0.service> - Phosphor Fan Presence =
Tach Daemon
>>    Loaded: loaded =
(/lib/systemd/system/obmc-chassis-poweron@0.target.requires =
<mailto:lib/systemd/system/obmc-chassis-poweron@0.target.requires>/../phos=
phor-fan-presence-tach@.service; static; vendor preset: enabled)
>>    Active: failed (Result: signal) since Tue 2019-04-16 15:34:06 UTC; =
1min 21s ago
>>   Process: 2183 ExecStart=3D/usr/bin/env phosphor-fan-presence-tach =
(code=3Dkilled, signal=3DABRT)
>>  Main PID: 2183 (code=3Dkilled, signal=3DABRT)
>> Apr 16 15:34:05 mingder systemd[1]: =
phosphor-fan-presence-tach@0.service =
<mailto:phosphor-fan-presence-tach@0.service>: Service RestartSec=3D1s =
expired, scheduling restart.
>> Apr 16 15:34:05 mingder systemd[1]: =
phosphor-fan-presence-tach@0.service =
<mailto:phosphor-fan-presence-tach@0.service>: Scheduled restart job, =
restart counter is at 2.
>> Apr 16 15:34:06 mingder systemd[1]: Stopped Phosphor Fan Presence =
Tach Daemon.
>> Apr 16 15:34:06 mingder systemd[1]: =
phosphor-fan-presence-tach@0.service =
<mailto:phosphor-fan-presence-tach@0.service>: Start request repeated =
too quickly.
>> Apr 16 15:34:06 mingder systemd[1]: =
phosphor-fan-presence-tach@0.service =
<mailto:phosphor-fan-presence-tach@0.service>: Failed with result =
'signal'.
>> Apr 16 15:34:06 mingder systemd[1]: Failed to start Phosphor Fan =
Presence Tach Daemon.
>> root@mingder:~#
>> After trying to execute it manually, I got this error:
>> root@mingder:~# /usr/bin/env phosphor-fan-presence-tach
>> terminate called after throwing an instance of =
'phosphor::fan::util::DBusMethodError'
>>   what():  DBus method call failed
>> Aborted
>> root@mingder:~#
> Could you provide the journal pretty output after running it manually =
for the entries in regard to phosphor-fan-presence-tach?
> 	`journalctl -o json-pretty`
> This may help show what object is failing the method call to dbus.
>> My config.yaml for phosphor-fan-presence-config-native/ is :
>> - name: fan1
>>   path: /system/chassis/motherboard/fan1
>>   methods:
>>     - type: tach
>>       sensors:
>>         - FAN1_L
>> - name: fan2
>>   path: /system/chassis/motherboard/fan2
>>   methods:
>>     - type: tach
>>       sensors:
>>         - FAN2_L
>> - name: fan3
>>   path: /system/chassis/motherboard/fan3
>>   methods:
>>     - type: tach
>>       sensors:
>>         - FAN3_L
>> - name: fan4
>>   path: /system/chassis/motherboard/fan4
>>   methods:
>>     - type: tach
>>       sensors:
>>         - FAN4_L
>> The /system/chassis/motherboard/fanX can be seen as :
>> [bradchou@localhost ~]$ curl -b cjar -k =
https://${bmc}/xyz/openbmc_project/inventory/system/chassis/motherboard/en=
umerate
>> "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1": {
>>       "Functional": true,
>>       "Present": true,
>>       "PrettyName": "fan1"
>>     },
>>     "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan2": =
{
>>       "Functional": true,
>>       "Present": true,
>>       "PrettyName": "fan2"
>>     },
>>     "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan3": =
{
>>       "Functional": true,
>>       "Present": true,
>>       "PrettyName": "fan3"
>>     },
>>     "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan4": =
{
>>       "Functional": true,
>>       "Present": true,
>>       "PrettyName": "fan4"
>>     },
>> I can also get the sensors for each FAN:
>> [bradchou@localhost ~]$ curl -b cjar -k =
https://${bmc}/xyz/openbmc_project/sensors/fan_tach/enumerate
>> "data": {
>>     "/xyz/openbmc_project/sensors/fan_tach/FAN1_L": {
>>       "CriticalAlarmHigh": false,
>>       "CriticalAlarmLow": false,
>>       "CriticalHigh": 20000,
>>       "CriticalLow": 1200,
>>       "MaxValue": 0,
>>       "MinValue": 0,
>>       "Scale": 0,
>>       "Target": 128,
>>       "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
>>       "Value": 10485
>>     },
>> It seems the sensor is ok and the inventory object for fan is also =
created.
>> But the phosphor-fan-presence-tach still failed.
>> Can anyone help me to figurate out what=E2=80=99s going wrong ?
>> Thanks.
>=20
