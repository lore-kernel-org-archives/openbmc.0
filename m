Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHj3C3Ld1zDq7Z
 for <openbmc@lists.ozlabs.org>; Wed,  3 May 2017 12:36:39 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI
 busses
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
Date: Tue, 2 May 2017 22:36:34 -0400
Cc: devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6AE33BFA-636B-4131-ABFC-3A8DC40F80DD@fuzziesquirrel.com>
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
To: Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Wed, 03 May 2017 02:36:40 -0000


> On May 2, 2017, at 1:55 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
>=20
> This change introduces a proposed layout for describing FSI busses in
> the device tree. While the bus is probe-able, we'd still like a method
> of describing subordinate (eg i2c) busses that are behind FSI devices.
>=20
> The FSI core will be responsible for matching probed slaves & engines =
to
> their device tree nodes, so the FSI device drivers' probe() functions
> will be passed a struct device with the appropriate of_node populated
> where a matching DT node is found.
>=20
> RFC at this stage, so I'd welcome any feedback.
>=20
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Acked-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

with some very inconsequential nits...

> ---
> Documentation/devicetree/bindings/fsi/fsi.txt | 144 =
++++++++++++++++++++++++++
> 1 file changed, 144 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/fsi/fsi.txt
>=20
> diff --git a/Documentation/devicetree/bindings/fsi/fsi.txt =
b/Documentation/devicetree/bindings/fsi/fsi.txt
> new file mode 100644
> index 0000000..b5e85c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/fsi.txt
> @@ -0,0 +1,144 @@
> +FSI bus & engine generic device tree bindings
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The FSI bus is probe-able, so Linux is able to enumerate FSI slaves, =
and
> +engines within those slaves. However, we have a facility to match =
devicetree
> +nodes to probed engines. This allows for fsi engines to expose =
non-probeable
> +busses, which are then exposed by the device tree. For example, a FSI =
engine
> +that is an I2C master - the I2C bus can be described by the device =
tree under
> +the engine's device tree node.
> +
> +FSI masters may require their own DT nodes (to describe the master HW =
itself);
> +that requirement is defined by the master's implementation, and is =
described by
> +the fsi-master-* binding specifications.
> +
> +Under the masters' nodes, we can describe the bus topology using =
nodes to
> +represent the FSI slaves and their slave engines. As a basic outline:
> +
> +  fsi-master {

an FSI master

> +      /* top-level of FSI bus topology, bound to a FSI master driver =
and
> +       * exposes a FSI bus */

an FSI bus

> +
> +      fsi-slave@<link,id> {
> +          /* this node defines the FSI slave device, and is handled
> +           * entirely with FSI core code */
> +
> +          fsi-slave-engine@<addr> {
> +              /* this node defines the engine endpoint & address =
range, which
> +               * is bound to the relevant fsi device driver */
> +               ...
> +          };
> +
> +          fsi-slave-engine@<addr> {
> +              ...
> +          };
> +
> +      };
> +  };
> +
> +Note that since the bus is probe-able, some (or all) of the topology =
may
> +not be described; this binding only provides an optional facility for
> +adding subordinate device tree nodes as children of FSI engines.
> +
> +FSI masters
> +-----------
> +
> +FSI master nodes declare themselves as such with the "fsi-master" =
compatible
> +value. It's likely that an implementation-specific compatible value =
will
> +be needed as well, for example:
> +
> +    compatible =3D "fsi-master-gpio", "fsi-master";
> +
> +Since the master nodes describe the top-level of the FSI topology, =
they also
> +need to declare the FSI-standard addressing scheme. This requires two =
cells for
> +addresses (link index and slave ID), and no size:
> +
> +    #address-cells =3D <2>;
> +    #size-cells =3D <0>;
> +
> +FSI slaves
> +----------
> +
> +Slaves are identified by a (link-index, slave-id) pair, so require =
two cells
> +for an address identifier. Since these are not a range, no size cells =
are
> +required. For an example, a slave on link 1, with ID 2, could be =
represented
> +as:
> +
> +    cfam@1,2 {
> +        reg =3D <1 2>;
> +	[...];
> +    }
> +
> +Each slave provides an address-space, under which the engines are =
accessible.
> +That address space has a maximum of 23 bits, so we use one cell to =
represent
> +addresses and sizes in the slave address space:
> +
> +    #address-cells =3D <1>;
> +    #size-cells =3D <1>;
> +
> +
> +FSI engines (devices)
> +---------------------
> +
> +Engines are identified by their address under the slaves' address =
spaces. We
> +use a single cell for address and size. Engine nodes represent the =
endpoint
> +FSI device, and are passed to those FSI device drivers' ->probe() =
functions.
> +
> +For example, for a slave using a single 0x400-byte page starting at =
address
> +0xc00:
> +
> +    engine@c00 {
> +        reg =3D <0xc00 0x400>;
> +    };
> +
> +
> +Full example
> +------------
> +
> +Here's an example that illustrates:
> + - a FSI master

an FSI master

> +   - connected to a FSI slave

an FSI slave

> +     - that contains an engine that is an I2C master
> +       - connected to an I2C EEPROM
> +
> +The FSI master may be connected to additional slaves, and slaves may =
have
> +additional engines, but they don't necessarily need to be describe in =
the
> +device tree if no extra platform information is required.
> +
> +    /* The GPIO-based FSI master node, describing the top level of =
the
> +     * FSI bus
> +     */
> +    gpio-fsi {
> +        compatible =3D "fsi-master-gpio", "fsi-master";
> +        #address-cells =3D <2>;
> +        #size-cells =3D <0>;
> +
> +        /* A FSI slave (aka. CFAM) at link 0, ID 0. */
> +        cfam@0,0 {
> +            reg =3D <0 0>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +
> +            /* FSI engine at 0xc00, using a single page. In this =
example,
> +             * it's an I2C master controller, so subnodes describe =
the
> +             * I2C bus.
> +             */
> +            i2c-controller@c00 {
> +                reg =3D <0xc00 0x400>;
> +
> +                /* Engine-specific data. In this case, we're =
describing an
> +                 * I2C bus, so we're conforming to the generic I2C =
binding
> +                 */
> +                compatible =3D "ibm,fsi-i2c";
> +                #address-cells =3D <1>;
> +                #size-cells =3D <1>;
> +
> +                /* I2C endpoint device: an Atmel EEPROM */
> +                eeprom@50 {
> +                    compatible =3D "atmel,24c256";
> +                    reg =3D <0x50>;
> +                    pagesize =3D <64>;
> +                };
> +            };
> +        };
> +    };
> --=20
> 2.7.4
