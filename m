Return-Path: <mikey@neuling.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7A3F11A1A1B
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 15:12:21 +1100 (AEDT)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 5660014010F;
 Fri, 18 Dec 2015 15:12:21 +1100 (AEDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
 id 4B99DEEB1D4; Fri, 18 Dec 2015 15:12:21 +1100 (AEDT)
Message-ID: <1450411941.2791.83.camel@neuling.org>
Subject: Re: [PATCH phosphor-host-ipmid v2] Add get/set ipmid command
 support with correct DBUS property handling.
From: Michael Neuling <mikey@neuling.org>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Date: Fri, 18 Dec 2015 15:12:21 +1100
In-Reply-To: <1450407024-32509-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450407024-32509-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450407024-32509-2-git-send-email-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 18 Dec 2015 04:12:21 -0000

> +ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cm=
d_t cmd,=20
> +                              ipmi_request_t request, ipmi_response_t re=
sponse,=20
> +                              ipmi_data_len_t data_len, ipmi_context_t c=
ontext)
> +{
> +    ipmi_ret_t rc =3D IPMI_CC_OK;
> +
> +    printf("IPMI SET_SYS_BOOT_OPTIONS\n");
> +    printf("IPMID set command required return bytes: %i\n", *data_len);
> +
> +    set_sys_boot_options_t *reqptr =3D (set_sys_boot_options_t*) request=
;
> +
> +    char* output_buf =3D (char*)malloc(NUM_RETURN_BYTES_OF_SET);

This seems to be allocating 1 byte.  Why not just allocate this
locally on the stack with:

   char output_buf;

then you can avoid the free and memory checks and a bunch of
other complexity.

I don't think you even need this buffer.

> +
> +    if (output_buf =3D=3D NULL) {
> +        fprintf(stderr, "Malloc failed for set_sys_boot_options.\n");
> +        return IPMI_OUT_OF_SPACE;       =20
> +    }
> +
> +    if (reqptr->parameter =3D=3D 5) // Parameter #5
> +    {
> +        char input_buf[NUM_INPUT_BYTES_OF_SET*2 + 1];
> +        sprintf(input_buf, "%llX", reqptr->data.data64);
> +
> +        int r =3D dbus_set_property(input_buf);
> +
> +        if (r < 0) {
> +            fprintf(stderr, "Dbus set property failed for set_sys_boot_o=
ptions.\n");
> +            return IPMI_OUT_OF_SPACE;
> +        }
> +
> +        *data_len =3D NUM_RETURN_BYTES_OF_SET;
> +        // 0x0: return code OK.
> +        output_buf[0] =3D 0x0;
> +        memcpy(response, output_buf, *data_len);

This is a memcpy of 1 byte.  Just assign it and remove the rest of the code=
.
     *response =3D 0;

> +        free(output_buf);
> +    }
> +    else
> +    {
> +        // 0x80: parameter not supported
> +        output_buf[0] =3D 0x80;
> +        memcpy(response, output_buf, *data_len);

*data_len is passed in, but output_buf is only 1 byte?  Doesn't make
overflowing output_buf really easy?

Or should this be a 1 byte copy too and then we can just assign it
with something like:
     *response =3D 0x80;

Mikey
