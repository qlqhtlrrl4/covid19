Handlebars.registerHelper('ifCond', function (v1, operator, v2, options) {
    switch (operator) {
        case '==':
            return (v1 == v2) ? options.fn(this) : options.inverse(this);
        case '===':
            return (v1 === v2) ? options.fn(this) : options.inverse(this);
        case '!=':
            return (v1 != v2) ? options.fn(this) : options.inverse(this);
        case '<':
            return (v1 < v2) ? options.fn(this) : options.inverse(this);
        case '<=':
            return (v1 <= v2) ? options.fn(this) : options.inverse(this);
        case '>':
            return (v1 > v2) ? options.fn(this) : options.inverse(this);
        case '>=':
            return (v1 >= v2) ? options.fn(this) : options.inverse(this);
        case '&&':
            return (v1 && v2) ? options.fn(this) : options.inverse(this);
        case '||':
            return (v1 || v2) ? options.fn(this) : options.inverse(this);
        default:
            return options.inverse(this);
    }
});

Handlebars.registerHelper("math", function(lvalue, operator, rvalue, options) {
    lvalue = parseInt(lvalue);
    rvalue = parseInt(rvalue);

    return {
        "+": lvalue + rvalue,
        "-": lvalue - rvalue,
        "*": lvalue * rvalue,
        "/": lvalue / rvalue,
        "%": lvalue % rvalue
    }[operator];
});

Handlebars.registerHelper('toLocaleString', function(number) {
    return number.toLocaleString();
});

Handlebars.registerHelper('for', function(from, to, incr, block) {
    var accum = '';
    for(var i = from; i <= to; i += incr)
        accum += block.fn(i);
    return accum;
});

Handlebars.registerHelper('lookup', function(obj, field) {
    return obj && obj[field];
});

Handlebars.registerHelper('addCommas', function(nStr) {
    if (!nStr) {
        return 0;
    }
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
});

Handlebars.registerHelper('fileSize', function(size) {
    var i = size == 0 ? 0 : Math.floor( Math.log(size) / Math.log(1024) );
    return ( size / Math.pow(1024, i) ).toFixed(2) * 1 + ' ' + ['B', 'kB', 'MB', 'GB', 'TB'][i];
});

Handlebars.registerHelper('eachInMap', function ( map, block ) {
    var out = '';
    Object.keys( map ).map(function( prop ) {
        out += block.fn( {key: prop, value: map[ prop ]} );
    });
    return out;
} );

Handlebars.getTemplate = function(name) {
    if (Handlebars.templates === undefined || Handlebars.templates[name] === undefined) {
        $.ajax({
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept","*/*");
            },
            dataType: "text",
            url : '/resources/handlebars/' + name + '.hbs',
            success : function(data) {
                if (Handlebars.templates === undefined) {
                    Handlebars.templates = {};
                }
                Handlebars.templates[name] = Handlebars.compile(data);
            },
            async : false
        });
    }

    return Handlebars.templates[name];
};

Handlebars.registerHelper( 'times', function( n, block ) {
    var accum = '',
        i = -1;

    while( ++i < n ) {
        accum += block.fn( i );
    }

    return accum;
});

Handlebars.registerHelper('date', function(d) {
    return moment(d).format("MM.DD");
});

Handlebars.registerHelper('if_bigger_or_equal', function(a, b, opts) {
    if (a >= b) {
        return opts.fn(this);
    } else {
        return opts.inverse(this);
    }
});

Handlebars.registerHelper('contains', function(v1, v2, options) {
    if (Array.isArray(v1)) {
        return (v1.indexOf(v2) != -1) ? options.fn(this) : options.inverse(this);
    } else {
        return options.inverse(this);
    }
});

Handlebars.registerHelper('notContains', function(v1, v2, options) {
    if (Array.isArray(v1)) {
        return (v1.indexOf(v2) == -1) ? options.fn(this) : options.inverse(this);
    } else {
        return options.inverse(this);
    }
});